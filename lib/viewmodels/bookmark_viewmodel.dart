import 'dart:async';

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkViewModel extends FamilyAsyncNotifier<List<Recipe>?, EatGoUser> {
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
    final bookmarkRecipeIds = _currentEatGoUser.bookmarkRecipeIds;
    try {
      final recipeList =
          await _recipeRepository.getRecipesFutureByIds(bookmarkRecipeIds);
      return recipeList;
    } catch (e) {
      debugPrint('BookmarkViewModel - 북마크레시피들을 불러오는데 오류 발생 : $e');
      return null;
    }
  }

  //북마크 상태를 토글하는 메서드
  //BookmarkViewModel은 여러 레시피의 북마크 상태를 관리하므로, 어떤 레시피를 토글할지 명확히 하기 위해 recipe 파라미터가 필요합니다.
  void toggleBookmark({Recipe? recipe}) async {
    try {
      EatGoUser? updatedEatGoUser;
      if (recipe == null) {
        debugPrint('BookmarkViewModel - recipe 값이 null입니다.');
        return;
      }
      final isBookmarked =
          _currentEatGoUser.bookmarkRecipeIds.any((b) => b == recipe.recipeId);

      if (isBookmarked) {
        updatedEatGoUser = _currentEatGoUser.copyWith(
          bookmarkRecipeIds: _currentEatGoUser.bookmarkRecipeIds
              .where((b) =>
                  b != recipe.recipeId) //현재 레시피와 ID가 다른 레시피들만 남긴다는 의미입니다.
              .toList(),
        );
      } else {
        updatedEatGoUser = _currentEatGoUser.copyWith(
          bookmarkRecipeIds: [
            ..._currentEatGoUser.bookmarkRecipeIds,
            recipe.recipeId,
          ],
        );
      }
      await _userRepository.updateUserData(updatedUser: updatedEatGoUser);
    } catch (e) {
      debugPrint('BookmarkViewModel - 북마크 토글하는데 실패하였습니다.$e');
    }
  }
}
