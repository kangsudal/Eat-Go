import 'dart:async';

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AsyncNotifier<Recipe?> {
  late final RecipeRepository _recipeRepository;
  late final UserRepository _userRepository;

  @override
  FutureOr<Recipe?> build() {
    _recipeRepository = ref.read(recipeRepositoryProvider);
    _userRepository = ref.read(userRepositoryProvider);

    return null;
  }

  //TextField에 키워드가 비어있을때 호출(비용절감을 위해)
  Future<Recipe?> getFilteredRandomRecipeWithoutKeyword({
    required Map<String, dynamic> categories,
  }) async {
    try {
      final Recipe? randomRecipe =
          await _recipeRepository.getFilteredRandomRecipeWithoutKeyword(
        categories: categories,
      );
      if (randomRecipe != null) {
        return randomRecipe;
      }
    } catch (e) {
      logger.e('RecipeViewModel - 랜덤 레시피 생성(keyword 없이)중 오류 발생', error: e);
      return null;
    }
    return null;
  }

  Future<Recipe?> getFilteredRandomRecipeWithKeyword({
    required Map<String, dynamic> categories,
    required String keywords,
  }) async {
    try {
      final Recipe? randomRecipe =
          await _recipeRepository.getFilteredRandomRecipeWithKeyword(
        categories: categories,
        keywords: keywords,
      );
      if (randomRecipe != null) {
        return randomRecipe;
      }
    } catch (e) {
      logger.e('RecipeViewModel - 랜덤 레시피 생성(with keyword)중 오류 발생', error: e);
      return null;
    }
    return null;
  }

  // 랜덤 레시피 가져오기 (결과가 없을 경우 재시도)
  Future<void> fetchRandomRecipeWithRetry({
    int maxRetries = 5,
    required Map<String, bool> categories,
    required String keywords,
  }) async {
    state = const AsyncValue.loading(); // 로딩 상태로 변경
    int retries = 0;

    while (retries < maxRetries) {
      try {
        // 키워드가 비어있다면 getRandomRecipeWithoutKeywords를 호출하고
        // 키워드가 있다면 getRandomRecipeWithKeywords를 호출합니다.
        Recipe? recipe;
        if (keywords.trim().isEmpty) {
          recipe = await getFilteredRandomRecipeWithoutKeyword(
            categories: categories,
          );
        } else {
          recipe = await getFilteredRandomRecipeWithKeyword(
            categories: categories,
            keywords: keywords,
          );
        }

        if (recipe != null) {
          state = AsyncValue.data(recipe); // 성공적으로 레시피를 가져오면 상태 업데이트
          return;
        }
        // recipe == null 이면 계속진행하여 retries++;로 간다.
      } catch (e, stackTrace) {
        logger.e('HomeViewModel', error: e);
        state = AsyncValue.error(e, stackTrace); // 에러가 발생하면 에러 상태로 업데이트
        return;
      }
      retries++;
    }

    // 최대 재시도 횟수를 초과하면 실패
    logger.w('HomeViewModel - 최대 재시도 횟수를 초과');
    state =
        AsyncValue.error('조건에 맞는 레시피가 없습니다. 다시 시도해주세요.', StackTrace.current);
  }

  //북마크 상태를 토글하는 메서드
  //HomeViewModel은 현재 보고 있는 레시피만을 다루기 때문에, recipe를 파라미터로 받지 않고 상태에서 바로 접근합니다.
  void toggleBookmark(EatGoUser? currentEatGoUser) async {
    try {
      EatGoUser? updatedEatGoUser;
      Recipe updatedRecipe;
      final Recipe? recipe = state.value;
      if (currentEatGoUser == null) {
        logger.w(
          'HomeViewModel - getCurrentUser가 null입니다. 현재 로그인된 사용자가 없는것 같습니다.',
        );
        return;
      }
      if (recipe == null) {
        logger.w('HomeViewModel - recipe 값이 null입니다.');
        return;
      }
      final isBookmarked =
          currentEatGoUser.bookmarkRecipeIds.contains(recipe.recipeId);

      if (isBookmarked) {
        // 1. 유저 컬렉션에 북마크 기록 업데이트
        updatedEatGoUser = currentEatGoUser.copyWith(
          bookmarkRecipeIds: currentEatGoUser.bookmarkRecipeIds
              .where(
                (b) => b != recipe.recipeId,
              ) //현재 레시피와 ID가 다른 레시피들만 남긴다는 의미입니다.
              .toList(),
        );
        // 2. 레시피 컬렉션에 북마크 기록 업데이트
        final List<String> updatedBookmarkedBy =
            List<String>.from(recipe.bookmarkedBy)
              ..remove(
                currentEatGoUser.uid,
              ); //List<String>.from():bookmarkedBy의 복사본을 만들어서 수정
        updatedRecipe = recipe.copyWith(bookmarkedBy: updatedBookmarkedBy);
      } else {
        // 1. 유저 컬렉션에 북마크 기록 업데이트
        updatedEatGoUser = currentEatGoUser.copyWith(
          bookmarkRecipeIds: [
            ...currentEatGoUser.bookmarkRecipeIds,
            recipe.recipeId,
          ],
        );
        // 2. 레시피 컬렉션에 북마크 기록 업데이트
        final List<String> updatedBookmarkedBy =
            List<String>.from(recipe.bookmarkedBy)..add(currentEatGoUser.uid);
        updatedRecipe = recipe.copyWith(bookmarkedBy: updatedBookmarkedBy);
      }
      // 1. 유저 컬렉션에 북마크 기록 업데이트
      await _userRepository.updateUserData(updatedUser: updatedEatGoUser);
      ref.read(currentEatGoUserProvider.notifier).state = AsyncValue.data(
        updatedEatGoUser,
      ); //getCurrentUser랑 다른점은 네트워크 호출을 안한다는 점이다. 이 라인을 넣어야 current
      // 2. 레시피 컬렉션에 북마크 기록 업데이트
      await _recipeRepository.updateRecipeData(updatedRecipe: updatedRecipe);
      state = AsyncValue.data(updatedRecipe); // HomeViewModel의 상태를 업데이트
    } catch (e, stackTrace) {
      logger.e('HomeViewModel - 북마크 토글하는데 실패하였습니다', error: e);
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
