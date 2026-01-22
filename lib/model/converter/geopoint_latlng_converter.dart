import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class MapToLatLngConverter
    implements JsonConverter<LatLng, Map<String, dynamic>> {
  const MapToLatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> location) {
    return LatLng(location['latitude'], location['longitude']);
  }

  @override
  Map<String, dynamic> toJson(LatLng latLng) {
    return {'latitude': latLng.latitude, 'longitudel': latLng.longitude};
  }
}
