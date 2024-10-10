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
      premiumExpiration: (json['premiumExpiration'] as num).toInt(),
      bookmarks: (json['bookmarks'] as List<dynamic>)
          .map((e) => Bookmark.fromJson(e as Map<String, dynamic>))
          .toList(),
      adoptedRecipes: (json['adoptedRecipes'] as List<dynamic>)
          .map((e) => AdoptedRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportedRecipes: (json['reportedRecipes'] as List<dynamic>)
          .map((e) => RecipeReport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EatGoUserImplToJson(_$EatGoUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'supportAmount': instance.supportAmount,
      'isPremium': instance.isPremium,
      'premiumExpiration': instance.premiumExpiration,
      'bookmarks': instance.bookmarks,
      'adoptedRecipes': instance.adoptedRecipes,
      'reportedRecipes': instance.reportedRecipes,
    };
