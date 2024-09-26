import 'package:freezed_annotation/freezed_annotation.dart';

part 'adopt_record_model.freezed.dart';
part 'adopt_record_model.g.dart';

@freezed
sealed class AdoptRecord with _$AdoptRecord {
  const factory AdoptRecord({
    required DateTime adoptedAt, //채택된 시간
    required String userUid, //채택한 유저 ID
  }) = _AdoptRecord;

  factory AdoptRecord.fromJson(Map<String, Object?> json) =>
      _$AdoptRecordFromJson(json);
}
