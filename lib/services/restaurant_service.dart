import 'dart:convert';

import 'package:eat_go/model/restaurant_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  // text(ex.레시피명)으로 장소 데이터들 가져오는 메서드
  Future<List<Restaurant>> fetchRestaurantByTextSearch({
    required String keyword,
  }) async {
    final Position location = await Geolocator.getCurrentPosition();
    final headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': dotenv.env['GOOGLE_MAPS_API_KEY']!,
      'X-Goog-FieldMask': 'places.id,'
          'places.displayName,'
          'places.photos,'
          'places.businessStatus,'
          'places.rating,'
          'places.priceLevel,'
          'places.websiteUri,'
          'places.googleMapsUri,'
          'places.formattedAddress,'
          'places.location',
    };
    final request = http.Request(
      'POST',
      Uri.parse('https://places.googleapis.com/v1/places:searchText'),
    );
    request.body = json.encode({
      'textQuery': keyword,
      'languageCode': 'ko',
      'locationBias': {
        'circle': {
          'center': {
            'latitude': location.latitude,
            'longitude': location.longitude,
          },
          'radius': 50000.0,
        },
      },
    });
    request.headers.addAll(headers);

    final http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final String result = await response.stream.bytesToString();
      final Map<String, dynamic> jsonData =
          json.decode(result) as Map<String, dynamic>;

      // 결과를 Restaurant 모델 리스트로 변환하여 반환
      final List<Restaurant> restaurants = [];
      if (jsonData['places'] != null) {
        for (var place in (jsonData['places'] as List<dynamic>)) {
          // debugPrint("place['rating'].runtimeType:${place['rating'].runtimeType}");
          // debugPrint("place['priceLevel'].runtimeType:${place['priceLevel'].runtimeType}");
          try {
            restaurants.add(Restaurant.fromJson(place));
          } catch (e) {
            debugPrint('Error parsing place: $e'); // JSON 구조가 예상과 다를 경우 로그로 확인
          }
        }
      }
      return restaurants;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}');
      debugPrint('Error: ${response.reasonPhrase}');
      return [];
    }
  }
}
