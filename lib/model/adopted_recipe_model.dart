import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adopted_recipe_model.freezed.dart';
part 'adopted_recipe_model.g.dart';

//AdoptRecord랑 다른점은
// AdoptRecord는 모든 사용자에 대한 기록,
// AdoptRecipe는 현재 이 User 개인에 대한 기록
@freezed
sealed class AdoptedRecipe with _$AdoptedRecipe {
  const factory AdoptedRecipe({
    required String recipeId,
    @TimestampConverter() required List<DateTime> adoptedAt,
    // required int adoptedCount,
  }) = _AdoptedRecipe;

  factory AdoptedRecipe.fromJson(Map<String, Object?> json) =>
      _$AdoptedRecipeFromJson(json);
}
