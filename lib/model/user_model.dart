import 'package:eat_go/model/adopted_recipe_model.dart';
import 'package:eat_go/model/bookmark_model.dart';
import 'package:eat_go/model/recipe_report_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String uid, //Apple것도 있으니 @앞에 id보다는 uui로 생성해주는게 나을듯
    required String displayName,
    // displayName: null일때 email id를 사용할 예정. 추후 프로필에서 수정가능하게 만들 예정
    required String email,
    @Default(0) double supportAmount, //: 0 //후원 비용
    @Default(false) bool isPremium, //: false //프리미엄 상태
    required DateTime premiumExpiration,
    required List<Bookmark> bookmarks, // 사용자가 북마크한 레시피 목록
    required List<AdoptedRecipe> adoptedRecipes, // 사용자가 채택한 레시피 목록
    required List<RecipeReport> reportedRecipes, // 사용자 신고한 레시피 목록, 목록에서 차단해주기
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
