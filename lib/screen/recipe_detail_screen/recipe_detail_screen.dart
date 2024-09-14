import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_widget/appbar.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_widget/bottom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Placeholder(
          fallbackHeight: 1000,
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }
}
