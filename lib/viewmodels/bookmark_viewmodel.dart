import 'dart:async';

import 'package:eat_go/model/bookmark_model.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkViewModel
    extends FamilyAsyncNotifier<List<Recipe>?, EatGoUser> {
  late final RecipeRepository _recipeRepository;
  late final UserRepository _userRepository;
  late final EatGoUser _currentEatGoUser;

  @override
  FutureOr<List<Recipe>?> build(EatGoUser arg) async {
    _recipeRepository = ref.watch(recipeRepositoryProvider);
    _userRepository = ref.watch(userRepositoryProvider);
    _currentEatGoUser = arg;
    return await fetchBookmarkList();
  }

  Future<List<Recipe>?> fetchBookmarkList() async {
    final bookmarkList = _currentEatGoUser.bookmarks;
    final bookmarkedRecipeIds = bookmarkList.map((bookmark) {
      return bookmark.recipeId;
    }).toList();
    try {
      final recipeList =
          await _recipeRepository.getRecipesFutureByIds(bookmarkedRecipeIds);
      return recipeList;
    } catch (e) {
      debugPrint('BookmarkViewModel - 북마크레시피들을 불러오는데 오류 발생 : $e');
      return null;
    }
  }

  //북마크 상태를 토글하는 메서드
  void toggleBookmark({Recipe? recipe}) async {
    try {
      EatGoUser? updatedEatGoUser;
      if (recipe == null) {
        debugPrint('BookmarkViewModel - recipe 값이 null입니다.');
        return;
      }
      final isBookmarked =
      _currentEatGoUser.bookmarks.any((b) => b.recipeId == recipe.recipeId);

      if (isBookmarked) {
        updatedEatGoUser = _currentEatGoUser.copyWith(
          bookmarks: _currentEatGoUser.bookmarks
              .where((b) =>
          b.recipeId !=
              recipe.recipeId) //현재 레시피와 ID가 다른 레시피들만 남긴다는 의미입니다.
              .toList(),
        );
      } else {
        updatedEatGoUser = _currentEatGoUser.copyWith(
          bookmarks: [
            ..._currentEatGoUser.bookmarks,
            Bookmark(recipeId: recipe.recipeId, bookmarkedAt: DateTime.now()),
          ],
        );
      }
      await _userRepository.updateUserData(updatedUser: updatedEatGoUser);
    } catch (e, stackTrace) {
      debugPrint('BookmarkViewModel - 북마크 토글하는데 실패하였습니다.$e');
    }
  }
}
