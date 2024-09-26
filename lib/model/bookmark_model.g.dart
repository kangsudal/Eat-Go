// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      recipeId: json['recipeId'] as String,
      bookmarkedAt: DateTime.parse(json['bookmarkedAt'] as String),
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'bookmarkedAt': instance.bookmarkedAt.toIso8601String(),
    };
