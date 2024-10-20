// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewRecordImpl _$$ViewRecordImplFromJson(Map<String, dynamic> json) =>
    _$ViewRecordImpl(
      userUid: json['userUid'] as String,
      viewedAt:
          const TimestampConverter().fromJson(json['viewedAt'] as Timestamp),
    );

Map<String, dynamic> _$$ViewRecordImplToJson(_$ViewRecordImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'viewedAt': const TimestampConverter().toJson(instance.viewedAt),
    };
