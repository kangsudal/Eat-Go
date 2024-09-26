// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopt_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdoptRecordImpl _$$AdoptRecordImplFromJson(Map<String, dynamic> json) =>
    _$AdoptRecordImpl(
      adoptedAt: DateTime.parse(json['adoptedAt'] as String),
      userUid: json['userUid'] as String,
    );

Map<String, dynamic> _$$AdoptRecordImplToJson(_$AdoptRecordImpl instance) =>
    <String, dynamic>{
      'adoptedAt': instance.adoptedAt.toIso8601String(),
      'userUid': instance.userUid,
    };
