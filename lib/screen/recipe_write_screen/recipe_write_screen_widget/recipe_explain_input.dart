import 'package:flutter/material.dart';

class RecipeExplainInput {
  RecipeExplainInput({
    required this.textEditingController,
    required this.globalKeyForScroll,
  });
  TextEditingController textEditingController;
  GlobalKey globalKeyForScroll;
}
