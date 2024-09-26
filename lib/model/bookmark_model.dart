import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';

part 'bookmark_model.g.dart';

@freezed
sealed class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String recipeId,
    required DateTime bookmarkedAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, Object?> json) =>
      _$BookmarkFromJson(json);
}
