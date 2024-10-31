import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// Timestamp ↔ DateTime 변환기
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate(); // Timestamp를 DateTime으로 변환
  }

  @override
  Timestamp toJson(DateTime dateTime)  => Timestamp.fromDate(dateTime);
}