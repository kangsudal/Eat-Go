// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      recipeId: json['recipeId'] as String,
      bookmarkedAt: const TimestampConverter()
          .fromJson(json['bookmarkedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'bookmarkedAt': const TimestampConverter().toJson(instance.bookmarkedAt),
    };
