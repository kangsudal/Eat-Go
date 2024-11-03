import 'dart:convert';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  final String apiKey;

  RestaurantService({required this.apiKey});

  // text(ex.레시피명)으로 장소 데이터들 가져오는 메서드
  void textSearch(String queryValue) async {
    final location = await Geolocator.getCurrentPosition();
    var headers = {
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
          'places.nationalPhoneNumber'
    };
    var request = http.Request('POST',
        Uri.parse('https://places.googleapis.com/v1/places:searchText'));
    request.body = json.encode({
      "textQuery": queryValue,
      "languageCode": "ko",
      "locationBias": {
        "circle": {
          "center": {
            "latitude": location.latitude,
            "longitude": location.longitude,
          },
          "radius": 50000.0
        }
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String result = await response.stream.bytesToString();
      print(result);
      // do something with the result
    } else {
      print(response.reasonPhrase);
    }
  }
}
