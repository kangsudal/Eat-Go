import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:eat_go/utils/app_logger.dart';

/// 북마크 관련 비즈니스 로직을 담당하는 서비스
///
/// 북마크 토글 시 사용자 컬렉션과 레시피 컬렉션을 동시에 업데이트합니다.
/// 이 로직이 HomeViewModel, RecipeDetailViewModel, BookmarkViewModel에서
/// 중복되어 있어 이 서비스로 통합합니다.
class BookmarkService {
  BookmarkService({
    required UserService userService,
    required RecipeService recipeService,
  })  : _userService = userService,
        _recipeService = recipeService;

  final UserService _userService;
  final RecipeService _recipeService;

  /// 북마크 상태를 토글합니다.
  ///
  /// [user]: 현재 로그인한 사용자
  /// [recipe]: 북마크할 레시피
  ///
  /// 반환값: (업데이트된 사용자, 업데이트된 레시피)
  /// 에러 발생 시 예외를 던집니다.
  Future<(EatGoUser, Recipe)> toggleBookmark({
    required EatGoUser user,
    required Recipe recipe,
  }) async {
    final isBookmarked = user.bookmarkRecipeIds.contains(recipe.recipeId);

    // 북마크 상태에 따라 업데이트할 데이터 계산
    final (updatedUser, updatedRecipe) = _calculateBookmarkChanges(
      user: user,
      recipe: recipe,
      isBookmarked: isBookmarked,
    );

    // 두 컬렉션을 병렬로 업데이트 (Race condition 방지)
    final results = await Future.wait([
      _userService.updateUserInfo(updatedUser: updatedUser),
      _recipeService.updateRecipeData(updatedRecipe: updatedRecipe),
    ]);

    // 업데이트 결과 확인
    final userUpdateSuccess = results[0];
    final recipeUpdateSuccess = results[1];

    if (!userUpdateSuccess || !recipeUpdateSuccess) {
      logger.e(
        'BookmarkService - 북마크 업데이트 실패: '
        'user=$userUpdateSuccess, recipe=$recipeUpdateSuccess',
      );
      throw Exception('북마크 업데이트에 실패했습니다.');
    }

    logger.i(
      'BookmarkService - 북마크 ${isBookmarked ? "제거" : "추가"} 완료: '
      'recipeId=${recipe.recipeId}',
    );

    return (updatedUser, updatedRecipe);
  }

  /// 북마크 상태 변경에 필요한 데이터를 계산합니다.
  (EatGoUser, Recipe) _calculateBookmarkChanges({
    required EatGoUser user,
    required Recipe recipe,
    required bool isBookmarked,
  }) {
    if (isBookmarked) {
      // 북마크 제거
      final updatedUser = user.copyWith(
        bookmarkRecipeIds: user.bookmarkRecipeIds
            .where((id) => id != recipe.recipeId)
            .toList(),
      );

      final updatedRecipe = recipe.copyWith(
        bookmarkedBy:
            recipe.bookmarkedBy.where((uid) => uid != user.uid).toList(),
      );

      return (updatedUser, updatedRecipe);
    } else {
      // 북마크 추가
      final updatedUser = user.copyWith(
        bookmarkRecipeIds: [...user.bookmarkRecipeIds, recipe.recipeId],
      );

      final updatedRecipe = recipe.copyWith(
        bookmarkedBy: [...recipe.bookmarkedBy, user.uid],
      );

      return (updatedUser, updatedRecipe);
    }
  }

  /// 현재 북마크 상태를 확인합니다.
  bool isBookmarked({
    required EatGoUser user,
    required String recipeId,
  }) {
    return user.bookmarkRecipeIds.contains(recipeId);
  }
}
