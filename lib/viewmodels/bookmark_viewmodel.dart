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

class BookmarkViewModel extends FamilyAsyncNotifier<List<Recipe>?, EatGoUser?> {
  // Late 초기화 대신 getter 사용으로 안전성 향상
  RecipeRepository get _recipeRepository => ref.watch(recipeRepositoryProvider);
  BookmarkService get _bookmarkService => ref.read(bookmarkServiceProvider);

  EatGoUser? _currentEatGoUser;

  @override
  FutureOr<List<Recipe>?> build(EatGoUser? arg) async {
    _currentEatGoUser = arg;
    if (_currentEatGoUser == null) {
      return null;
    }
    return await fetchBookmarkList();
  }

  Future<List<Recipe>?> fetchBookmarkList() async {
    if (_currentEatGoUser == null) {
      return null;
    }

    final bookmarkRecipeIds = _currentEatGoUser!.bookmarkRecipeIds;
    try {
      final recipeList =
          await _recipeRepository.getRecipesFutureByIds(bookmarkRecipeIds);
      return recipeList;
    } catch (e) {
      logger.e('BookmarkViewModel - 북마크레시피들을 불러오는데 오류 발생', error: e);
      return null;
    }
  }

  /// 북마크 상태를 토글하는 메서드
  ///
  /// BookmarkViewModel은 여러 레시피의 북마크 상태를 관리하므로,
  /// 어떤 레시피를 토글할지 명확히 하기 위해 recipe 파라미터가 필요합니다.
  ///
  /// [recipe]: 북마크 토글할 레시피
  /// 반환값: 성공 시 true, 실패 시 false
  Future<bool> toggleBookmark({Recipe? recipe}) async {
    // 유효성 검사
    if (_currentEatGoUser == null) {
      logger.w('BookmarkViewModel - currentEatGoUser 값이 null입니다.');
      return false;
    }
    if (recipe == null) {
      logger.w('BookmarkViewModel - recipe 값이 null입니다.');
      return false;
    }

    try {
      // BookmarkService를 사용하여 북마크 토글
      // Future.wait로 병렬 처리하여 Race condition 방지
      final (updatedUser, _) = await _bookmarkService.toggleBookmark(
        user: _currentEatGoUser!,
        recipe: recipe,
      );

      // 로컬 상태 업데이트
      _currentEatGoUser = updatedUser;

      // 글로벌 사용자 상태 업데이트
      ref.read(currentEatGoUserProvider.notifier).state = AsyncValue.data(
        updatedUser,
      );

      // 북마크 목록 새로고침
      final updatedList = await fetchBookmarkList();
      state = AsyncValue.data(updatedList);

      return true;
    } catch (e) {
      logger.e('BookmarkViewModel - 북마크 토글하는데 실패하였습니다', error: e);
      return false;
    }
  }
}
