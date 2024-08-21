import 'package:flutter/material.dart';

class FakeRecipe extends Color {
  final String id;
  bool bookmarked;
  DateTime createdAt;

  FakeRecipe(
    super.value, {
    required this.id,
    this.bookmarked = false,
    required this.createdAt,
  });
}
