import 'package:eat_go/model/adopted_recipe_model.dart';
import 'package:eat_go/model/bookmark_model.dart';
import 'package:eat_go/model/recipe_report_model.dart';

class User {
  String uid; //Apple것도 있으니 @앞에 id보다는 uui로 생성해주는게 나을듯

  String displayName; // null일때 email id를 사용할 예정. 추후 프로필에서 수정가능하게 만들 예정

  String email;

  double supportAmount;//: 0 //후원 비용

  bool isPremium;//: false //프리미엄 상태

  DateTime premiumExpiration;

  List<Bookmark> bookmarks; // 사용자가 북마크한 레시피 목록

  List<AdoptedRecipe> adoptedRecipes; // 사용자가 채택한 레시피 목록

  List<RecipeReport> reportedRecipes; // 사용자 신고한 레시피 목록, 목록에서 차단해주기
}