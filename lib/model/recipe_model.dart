import 'package:eat_go/model/description_model.dart';
import 'package:eat_go/model/adopt_record_model.dart';
import 'package:eat_go/model/bookmark_record_model.dart';
import 'package:eat_go/model/view_record_model.dart';

class Recipe{
  String recipeId;
  String title;
  String ingredients;
  String ingredientsImgUrl;
  List<Description> descriptions;
  String category;
  String hashTag;
  String completedImgUrl;
  DateTime createdAt;
  String createBy; //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
  String createdByType; // 'user' or 'system' : 작성자 유형
  DateTime updatedAt;
  List<AdoptRecord> adoptedBy; //이 레시피가 채택된 기록 (채택된 시간, 채택된 유저 id)
  List<BookmarkRecord> bookmarkedBy; //이 레시피를 북마크한 유저 리스트
  List<ViewRecord> viewedBy; //이 레시피 조회한 유저
}