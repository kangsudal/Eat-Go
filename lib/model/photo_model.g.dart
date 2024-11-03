// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      name: json['name'] as String,
      widthPx: (json['widthPx'] as num).toInt(),
      heightPx: (json['heightPx'] as num).toInt(),
      authorAttributions: (json['authorAttributions'] as List<dynamic>)
          .map((e) => AuthorAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      flagContentUri: json['flagContentUri'] as String,
      googleMapsUri: json['googleMapsUri'] as String,
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'widthPx': instance.widthPx,
      'heightPx': instance.heightPx,
      'authorAttributions':
          instance.authorAttributions.map((e) => e.toJson()).toList(),
      'flagContentUri': instance.flagContentUri,
      'googleMapsUri': instance.googleMapsUri,
    };
