// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EatGoUserImpl _$$EatGoUserImplFromJson(Map<String, dynamic> json) =>
    _$EatGoUserImpl(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      supportAmount: (json['supportAmount'] as num?)?.toDouble() ?? 0,
      isPremium: json['isPremium'] as bool? ?? false,
      premiumExpiration: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['premiumExpiration'],
        const TimestampConverter().fromJson,
      ),
      bookmarkRecipeIds: (json['bookmarkRecipeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      clappedRecipeIds: (json['clappedRecipeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recipeReportIds: (json['recipeReportIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pushNotificationEnabled: json['pushNotificationEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$EatGoUserImplToJson(_$EatGoUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'supportAmount': instance.supportAmount,
      'isPremium': instance.isPremium,
      'premiumExpiration': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.premiumExpiration,
        const TimestampConverter().toJson,
      ),
      'bookmarkRecipeIds': instance.bookmarkRecipeIds,
      'clappedRecipeIds': instance.clappedRecipeIds,
      'recipeReportIds': instance.recipeReportIds,
      'pushNotificationEnabled': instance.pushNotificationEnabled,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
