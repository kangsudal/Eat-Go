// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_attribution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorAttributionImpl _$$AuthorAttributionImplFromJson(
  Map<String, dynamic> json,
) =>
    _$AuthorAttributionImpl(
      displayName: json['displayName'] as String,
      uri: json['uri'] as String,
      photoUri: json['photoUri'] as String,
    );

Map<String, dynamic> _$$AuthorAttributionImplToJson(
  _$AuthorAttributionImpl instance,
) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'uri': instance.uri,
      'photoUri': instance.photoUri,
    };
