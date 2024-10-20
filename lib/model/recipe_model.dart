import 'package:eat_go/model/description_model.dart';
import 'package:eat_go/model/adopt_record_model.dart';
import 'package:eat_go/model/bookmark_record_model.dart';
import 'package:eat_go/model/view_record_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';

part 'recipe_model.g.dart';

@freezed
sealed class Recipe with _$Recipe {
  const factory Recipe({
    required String recipeId,
    required String title,
    required String ingredients,
    required String ingredientsImgUrl,
    required List<Description> descriptions,
    required String category,
    required String hashTag,
    required String completedImgUrl,
    required DateTime createdAt,
    required String createdBy, //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
    required DateTime updatedAt,
    required List<AdoptRecord> adoptedBy, //이 레시피가 채택된 기록 (채택된 시간, 채택된 유저 id)
    required List<BookmarkRecord> bookmarkedBy, //이 레시피를 북마크한 유저 리스트
    required List<ViewRecord> viewedBy, //이 레시피 조회한 유저
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
