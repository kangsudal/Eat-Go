import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointLatLngConverter implements JsonConverter<LatLng, GeoPoint> {
  const GeoPointLatLngConverter();

  @override
  LatLng fromJson(GeoPoint geoPoint) {
    return LatLng(geoPoint.latitude, geoPoint.longitude);
  }

  @override
  GeoPoint toJson(LatLng latLng) {
    return GeoPoint(latLng.latitude, latLng.longitude);
  }
}
