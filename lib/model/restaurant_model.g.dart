// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String,
      displayName: Restaurant._extractDisplayName(
        json['displayName'] as Map<String, dynamic>,
      ),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessStatus: json['businessStatus'] as String?,
      rating: Restaurant._parseRating(json['rating']),
      priceLevel: Restaurant._parsePriceLevel(json['priceLevel']),
      websiteUri: json['websiteUri'] as String?,
      googleMapsUri: json['googleMapsUri'] as String,
      formattedAddress: json['formattedAddress'] as String,
      location: const MapToLatLngConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'photos': instance.photos?.map((e) => e.toJson()).toList(),
      'businessStatus': instance.businessStatus,
      'rating': instance.rating,
      'priceLevel': instance.priceLevel,
      'websiteUri': instance.websiteUri,
      'googleMapsUri': instance.googleMapsUri,
      'formattedAddress': instance.formattedAddress,
      'location': const MapToLatLngConverter().toJson(instance.location),
    };
