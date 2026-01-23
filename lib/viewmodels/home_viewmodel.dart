import 'dart:async';

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/bookmark_providers.dart';
import 'package:eat_go/provider/recipe_providers.dart';
import 'package:eat_go/provider/user_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/services/bookmark_service.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AsyncNotifier<Recipe?> {
  // Late 초기화 대신 getter 사용으로 안전성 향상
  RecipeRepository get _recipeRepository => ref.read(recipeRepositoryProvider);
  BookmarkService get _bookmarkService => ref.read(bookmarkServiceProvider);

  @override
  FutureOr<Recipe?> build() {
    return null;
  }

  // TextField에 키워드가 비어있을때 호출 (비용절감을 위해)
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
    state = const AsyncValue.loading();
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
          state = AsyncValue.data(recipe);
          return;
        }
      } catch (e, stackTrace) {
        logger.e('HomeViewModel', error: e);
        state = AsyncValue.error(e, stackTrace);
        return;
      }
      retries++;
    }

    // 최대 재시도 횟수를 초과하면 실패
    logger.w('HomeViewModel - 최대 재시도 횟수를 초과');
    state = AsyncValue.error(
      '조건에 맞는 레시피가 없습니다. 다시 시도해주세요.',
      StackTrace.current,
    );
  }

  /// 북마크 상태를 토글하는 메서드
  ///
  /// [currentEatGoUser]: 현재 로그인한 사용자
  /// 반환값: 성공 시 true, 실패 시 false
  Future<bool> toggleBookmark(EatGoUser? currentEatGoUser) async {
    final Recipe? recipe = state.value;

    // 유효성 검사
    if (currentEatGoUser == null) {
      logger.w(
        'HomeViewModel - getCurrentUser가 null입니다. 현재 로그인된 사용자가 없는것 같습니다.',
      );
      return false;
    }
    if (recipe == null) {
      logger.w('HomeViewModel - recipe 값이 null입니다.');
      return false;
    }

    try {
      // BookmarkService를 사용하여 북마크 토글
      // Future.wait로 병렬 처리하여 Race condition 방지
      final (updatedUser, updatedRecipe) = await _bookmarkService.toggleBookmark(
        user: currentEatGoUser,
        recipe: recipe,
      );

      // 모든 업데이트가 완료된 후에만 UI 상태 업데이트
      ref.read(currentEatGoUserProvider.notifier).state = AsyncValue.data(
        updatedUser,
      );
      state = AsyncValue.data(updatedRecipe);

      return true;
    } catch (e, stackTrace) {
      logger.e('HomeViewModel - 북마크 토글하는데 실패하였습니다', error: e);
      state = AsyncValue.error(e, stackTrace);
      return false;
    }
  }
}
