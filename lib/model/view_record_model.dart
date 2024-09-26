import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_record_model.freezed.dart';

part 'view_record_model.g.dart';

@freezed
sealed class ViewRecord with _$ViewRecord {
  const factory ViewRecord({
    required String userUid, //조회한 유저 ID
    required DateTime viewedAt, //조회한 날짜
  }) = _ViewRecord;

  factory ViewRecord.fromJson(Map<String, Object?> json) =>
      _$ViewRecordFromJson(json);
}
