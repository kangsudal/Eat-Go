// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopted_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdoptedRecipeImpl _$$AdoptedRecipeImplFromJson(Map<String, dynamic> json) =>
    _$AdoptedRecipeImpl(
      recipeId: json['recipeId'] as String,
      adoptedAt: (json['adoptedAt'] as List<dynamic>)
          .map((e) => const TimestampConverter().fromJson(e as Timestamp))
          .toList(),
    );

Map<String, dynamic> _$$AdoptedRecipeImplToJson(_$AdoptedRecipeImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'adoptedAt':
          instance.adoptedAt.map(const TimestampConverter().toJson).toList(),
    };
