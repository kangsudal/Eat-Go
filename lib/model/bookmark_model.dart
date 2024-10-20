import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';

part 'bookmark_model.g.dart';

@freezed
sealed class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String recipeId,
    @TimestampConverter() required DateTime bookmarkedAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, Object?> json) =>
      _$BookmarkFromJson(json);
}
