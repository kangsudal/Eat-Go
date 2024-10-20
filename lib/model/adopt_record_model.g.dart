// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopt_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdoptRecordImpl _$$AdoptRecordImplFromJson(Map<String, dynamic> json) =>
    _$AdoptRecordImpl(
      adoptedAt:
          const TimestampConverter().fromJson(json['adoptedAt'] as Timestamp),
      userUid: json['userUid'] as String,
    );

Map<String, dynamic> _$$AdoptRecordImplToJson(_$AdoptRecordImpl instance) =>
    <String, dynamic>{
      'adoptedAt': const TimestampConverter().toJson(instance.adoptedAt),
      'userUid': instance.userUid,
    };
