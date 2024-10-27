// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      recipeId: json['recipeId'] as String,
      title: json['title'] as String,
      ingredients: json['ingredients'] as String,
      ingredientsImgUrl: json['ingredientsImgUrl'] as String,
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String,
      hashTag: json['hashTag'] as String,
      completedImgUrl: json['completedImgUrl'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      createdBy: json['createdBy'] as String,
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      claps: (json['claps'] as num).toInt(),
      userClapCounts: Map<String, int>.from(json['userClapCounts'] as Map),
      bookmarkedBy: (json['bookmarkedBy'] as List<dynamic>)
          .map((e) => BookmarkRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewedBy: (json['viewedBy'] as List<dynamic>)
          .map((e) => ViewRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'ingredients': instance.ingredients,
      'ingredientsImgUrl': instance.ingredientsImgUrl,
      'descriptions': instance.descriptions.map((e) => e.toJson()).toList(),
      'category': instance.category,
      'hashTag': instance.hashTag,
      'completedImgUrl': instance.completedImgUrl,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'createdBy': instance.createdBy,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'claps': instance.claps,
      'userClapCounts': instance.userClapCounts,
      'bookmarkedBy': instance.bookmarkedBy.map((e) => e.toJson()).toList(),
      'viewedBy': instance.viewedBy.map((e) => e.toJson()).toList(),
    };
