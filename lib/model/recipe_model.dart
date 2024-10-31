import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/clap_record_model.dart';
import 'package:eat_go/model/description_model.dart';
import 'package:eat_go/model/converter/timestamp_converter.dart';

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
    @TimestampConverter() required DateTime createdAt,
    required String
        createdBy, //currentUser.uid:'식품의약품안전처'.uid, //사용자 UID 또는 시스템
    @TimestampConverter() required DateTime updatedAt,
    required List<ClapRecord> clapRecords, //각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
    required List<String> bookmarkedBy, //이 레시피를 북마크한 유저 UID 리스트
    required List<String> viewedBy, //이 레시피 조회한 유저 UID 리스트
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
