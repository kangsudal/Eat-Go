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
      premiumExpiration: const TimestampConverter()
          .fromJson(json['premiumExpiration'] as Timestamp),
      bookmarks: (json['bookmarks'] as List<dynamic>)
          .map((e) => Bookmark.fromJson(e as Map<String, dynamic>))
          .toList(),
      adoptedRecipes: (json['adoptedRecipes'] as List<dynamic>)
          .map((e) => AdoptedRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipeReportIds: (json['recipeReportIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pushNotificationEnabled: json['pushNotificationEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$EatGoUserImplToJson(_$EatGoUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'supportAmount': instance.supportAmount,
      'isPremium': instance.isPremium,
      'premiumExpiration':
          const TimestampConverter().toJson(instance.premiumExpiration),
      'bookmarks': instance.bookmarks.map((e) => e.toJson()).toList(),
      'adoptedRecipes': instance.adoptedRecipes.map((e) => e.toJson()).toList(),
      'recipeReportIds': instance.recipeReportIds,
      'pushNotificationEnabled': instance.pushNotificationEnabled,
    };
