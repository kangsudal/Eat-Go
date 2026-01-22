import 'package:flutter/material.dart';

class FakeRecipe extends Color {
  FakeRecipe(
    super.value, {
    required this.id,
    this.bookmarked = false,
    required this.createdAt,
  });
  final String id;
  bool bookmarked;
  DateTime createdAt;
}
