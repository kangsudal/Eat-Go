import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/converter/geopoint_latlng_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
sealed class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String name, // 장소 이름
    required List<String> photoUrls, // 이미지 리스트 (URL)
    required String businessStatus, // 운영 상태
    required double rating, // 평점
    required int priceLevel, // 가격대 (0 - 무료, 4 - 매우 비쌈)
    required String website, // 웹사이트 URL
    required String placeId, // 장소 고유 ID
    required String address, // 위치 주소
    required String phoneNumber, // 전화번호
    @GeoPointLatLngConverter() required LatLng location, // 위도와 경도 포함 위치
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
}