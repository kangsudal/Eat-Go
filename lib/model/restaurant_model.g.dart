// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      name: json['name'] as String,
      photoUrls:
          (json['photoUrls'] as List<dynamic>).map((e) => e as String).toList(),
      businessStatus: json['businessStatus'] as String,
      rating: (json['rating'] as num).toDouble(),
      priceLevel: (json['priceLevel'] as num).toInt(),
      website: json['website'] as String,
      placeId: json['placeId'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: const GeoPointLatLngConverter()
          .fromJson(json['location'] as GeoPoint),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoUrls': instance.photoUrls,
      'businessStatus': instance.businessStatus,
      'rating': instance.rating,
      'priceLevel': instance.priceLevel,
      'website': instance.website,
      'placeId': instance.placeId,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'location': const GeoPointLatLngConverter().toJson(instance.location),
    };
