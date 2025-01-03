import 'dart:async';

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<Recipe, String> {
  late final RecipeRepository _recipeRepository;
  late final UserRepository _userRepository;
  late final String _recipeId;

  @override
  FutureOr<Recipe> build(String arg) async {
    _recipeRepository = ref.watch(recipeRepositoryProvider);
    _userRepository = ref.watch(userRepositoryProvider);
    _recipeId = arg;

    return await fetchRecipe(recipeId: _recipeId);
  }

  Future<Recipe> fetchRecipe({required String recipeId}) async {
    try {
      Recipe recipe = await _recipeRepository.getRecipeById(recipeId: recipeId);
      return recipe;
    } catch (e) {
      rethrow;
    }
  }

  //북마크 상태를 토글하는 메서드
  //RecipeDetailViewModel은 현재 보고 있는 레시피만을 다루기 때문에, recipe를 파라미터로 받지 않고 상태에서 바로 접근합니다.
  void toggleBookmark(EatGoUser? currentEatGoUser) async {
    try {
      EatGoUser? updatedEatGoUser;
      Recipe updatedRecipe;
      Recipe? recipe = state.value;
      if (currentEatGoUser == null) {
        debugPrint(
            'RecipeDetailViewModel - getCurrentUser가 null입니다. 현재 로그인된 사용자가 없는것 같습니다.');
        return;
      }
      if (recipe == null) {
        debugPrint('RecipeDetailViewModel - recipe 값이 null입니다.');
        return;
      }
      final isBookmarked =
          currentEatGoUser.bookmarkRecipeIds.contains(recipe.recipeId);

      if (isBookmarked) {
        // 1. 유저 컬렉션에 북마크 기록 업데이트
        updatedEatGoUser = currentEatGoUser.copyWith(
          bookmarkRecipeIds: currentEatGoUser.bookmarkRecipeIds
              .where((b) =>
                  b != recipe.recipeId) //현재 레시피와 ID가 다른 레시피들만 남긴다는 의미입니다.
              .toList(),
        );

        // 2. 레시피 컬렉션에 북마크 기록 업데이트
        List<String> updatedBookmarkedBy =
            List<String>.from(recipe.bookmarkedBy)
              ..remove(currentEatGoUser
                  .uid); //List<String>.from():bookmarkedBy의 복사본을 만들어서 수정
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
        List<String> updatedBookmarkedBy =
            List<String>.from(recipe.bookmarkedBy)..add(currentEatGoUser.uid);
        updatedRecipe = recipe.copyWith(bookmarkedBy: updatedBookmarkedBy);
      }
      // 1. 유저 컬렉션에 북마크 기록 업데이트
      await _userRepository.updateUserData(updatedUser: updatedEatGoUser);
      // 2. 레시피 컬렉션에 북마크 기록 업데이트
      await _recipeRepository.updateRecipeData(updatedRecipe: updatedRecipe);

      ref.read(currentEatGoUserProvider.notifier).state = AsyncValue.data(
          updatedEatGoUser); //getCurrentUser랑 다른점은 네트워크 호출을 안한다는 점이다. 이 부분을 넣어야 currentEatGoUser가 갱신되고 appBar의 action에 있는 북마크가 다시그려진다.
      state = AsyncValue.data(updatedRecipe); // RecipeDetailViewModel의 상태를 업데이트
    } catch (e, stackTrace) {
      debugPrint('RecipeDetailViewModel - 북마크 토글하는데 실패하였습니다.$e');
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
