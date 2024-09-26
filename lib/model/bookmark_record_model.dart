import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_record_model.freezed.dart';
part 'bookmark_record_model.g.dart';

@freezed
sealed class BookmarkRecord with _$BookmarkRecord {
  const factory BookmarkRecord({
    required String userUid, //북마크한 유저 ID
  }) = _BookmarkRecord;

  factory BookmarkRecord.fromJson(Map<String, Object?> json) =>
      _$BookmarkRecordFromJson(json);
}
