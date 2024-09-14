import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_widget/appbar.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_widget/bottom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  RecipeDetailScreen({super.key});

  final List recipeExplains = List.generate(20, (index) => Container());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
          child: Column(
            children: [
              buildIngredients(),
              SizedBox(height: 50),
              ...buildRecipeExplainAndImgSets(),
              SizedBox(height: 50),
              buildCompletedRecipe(),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  Column buildIngredients() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Placeholder(
            fallbackHeight: 180,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: EatGoPalette.lineColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }

  List<Column> buildRecipeExplainAndImgSets() {
    return List.generate(recipeExplains.length, (index) {
      return Column(
        children: [
          Container(
            // height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: EatGoPalette.lineColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$index.'),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                        'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata'
                        'datadatadatadatadatadatadata'
                        'datadatadatadatadatadatadatadata'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Placeholder(
              fallbackHeight: 180,
            ),
          ),
          if (index != recipeExplains.length - 1) const SizedBox(height: 40),
        ],
      );
    });
  }

  Column buildCompletedRecipe() {
    return Column(
      children: [
        Text(
          '{매실소스를 곁들인 돼지고기만두} 완성!',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Placeholder(fallbackHeight: 300),
        ),
      ],
    );
  }
}
