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

class RecipeDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<Recipe, String> {
  // Late 초기화 대신 getter 사용으로 안전성 향상
  RecipeRepository get _recipeRepository => ref.watch(recipeRepositoryProvider);
  BookmarkService get _bookmarkService => ref.read(bookmarkServiceProvider);

  late final String _recipeId;

  @override
  FutureOr<Recipe> build(String arg) async {
    _recipeId = arg;
    return await fetchRecipe(recipeId: _recipeId);
  }

  Future<Recipe> fetchRecipe({required String recipeId}) async {
    try {
      final Recipe recipe =
          await _recipeRepository.getRecipeById(recipeId: recipeId);
      return recipe;
    } catch (e) {
      rethrow;
    }
  }

  /// 북마크 상태를 토글하는 메서드
  ///
  /// RecipeDetailViewModel은 현재 보고 있는 레시피만을 다루기 때문에,
  /// recipe를 파라미터로 받지 않고 상태에서 바로 접근합니다.
  ///
  /// [currentEatGoUser]: 현재 로그인한 사용자
  /// 반환값: 성공 시 true, 실패 시 false
  Future<bool> toggleBookmark(EatGoUser? currentEatGoUser) async {
    final Recipe? recipe = state.value;

    // 유효성 검사
    if (currentEatGoUser == null) {
      logger.w(
        'RecipeDetailViewModel - getCurrentUser가 null입니다. 현재 로그인된 사용자가 없는것 같습니다.',
      );
      return false;
    }
    if (recipe == null) {
      logger.w('RecipeDetailViewModel - recipe 값이 null입니다.');
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
      logger.e('RecipeDetailViewModel - 북마크 토글하는데 실패하였습니다', error: e);
      state = AsyncValue.error(e, stackTrace);
      return false;
    }
  }
}
