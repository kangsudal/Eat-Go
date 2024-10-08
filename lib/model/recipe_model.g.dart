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
      createdAt: (json['createdAt'] as num).toInt(),
      createdBy: json['createdBy'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
      adoptedBy: (json['adoptedBy'] as List<dynamic>)
          .map((e) => AdoptRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'descriptions': instance.descriptions,
      'category': instance.category,
      'hashTag': instance.hashTag,
      'completedImgUrl': instance.completedImgUrl,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt,
      'adoptedBy': instance.adoptedBy,
      'bookmarkedBy': instance.bookmarkedBy,
      'viewedBy': instance.viewedBy,
    };
