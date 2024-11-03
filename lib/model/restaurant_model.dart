import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/converter/geopoint_latlng_converter.dart';
import 'package:eat_go/model/photo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
sealed class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id, // 장소 고유 ID
    @JsonKey(fromJson: Restaurant._extractDisplayName) required String displayName, // 장소 이름
    List<Photo>? photos, // 이미지 리스트 (URL)
    String? businessStatus, // 운영 상태
    @JsonKey(fromJson: Restaurant._parseRating) double? rating, // 평점
    @JsonKey(fromJson: Restaurant._parsePriceLevel) int? priceLevel, // 가격대 (0 - 무료, 4 - 매우 비쌈)
    String? websiteUri, // 웹사이트 URL
    required String googleMapsUri, // 구글 장소 URL
    required String formattedAddress, // 위치 주소
    // required String nationalPhoneNumber, // 전화번호 location과 같이 request하면 Bad Reespose가 뜨므로 제거했음.
    @MapToLatLngConverter() required LatLng location, // 위도와 경도 포함 위치
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);

  // displayName의 text만 추출하는 함수
  static String _extractDisplayName(Map<String, dynamic> displayName) {
    return displayName['text'] as String;
  }

  // 커스텀 변환 함수들
  static double _parseRating(dynamic value) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }

  static int _parsePriceLevel(dynamic value) {
    if (value is num) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value) ?? 1;
    }
    return -1;
  }
}