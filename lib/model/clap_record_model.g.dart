// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clap_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClapRecordImpl _$$ClapRecordImplFromJson(Map<String, dynamic> json) =>
    _$ClapRecordImpl(
      userUid: json['userUid'] as String,
      clapCount: (json['clapCount'] as num).toInt(),
    );

Map<String, dynamic> _$$ClapRecordImplToJson(_$ClapRecordImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'clapCount': instance.clapCount,
    };
