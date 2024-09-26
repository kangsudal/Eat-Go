// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewRecordImpl _$$ViewRecordImplFromJson(Map<String, dynamic> json) =>
    _$ViewRecordImpl(
      userUid: json['userUid'] as String,
      viewedAt: DateTime.parse(json['viewedAt'] as String),
    );

Map<String, dynamic> _$$ViewRecordImplToJson(_$ViewRecordImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'viewedAt': instance.viewedAt.toIso8601String(),
    };
