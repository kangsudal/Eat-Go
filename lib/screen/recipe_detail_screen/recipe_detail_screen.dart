import 'package:cached_network_image/cached_network_image.dart';
import 'package:eat_go/model/description_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_widget/appbar.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_widget/bottom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailScreen extends ConsumerWidget {
  RecipeDetailScreen({
    super.key,
    required this.recipeId,
  });

  // final List recipeExplains = List.generate(20, (index) => Container());
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeDetailViewState =
        ref.watch(recipeDetailViewModelProvider(recipeId));

    return recipeDetailViewState.when(
      data: (recipe) {
        String ingredientsImgUrl = recipe.ingredientsImgUrl;
        String ingredients = recipe.ingredients;
        List<Description> descriptions = recipe.descriptions;
        String title = recipe.title;
        String completedImgUrl = recipe.completedImgUrl;
        return Scaffold(
          appBar: RecipeDetailAppBar(recipe: recipe),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: Column(
                children: [
                  buildIngredients(
                    ingredients: ingredients,
                    ingredientsImgUrl: ingredientsImgUrl,
                  ),
                  SizedBox(height: 50),
                  ...buildRecipeExplainAndImgSets(descriptions),
                  SizedBox(height: 50),
                  buildCompletedRecipe(
                      title: title, completedImgUrl: completedImgUrl),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ),
          bottomNavigationBar: RecipeDetailBottomAppBar(recipe: recipe),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text('오류가 발생하였습니다.'),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Column buildIngredients(
      {required String ingredients, required String ingredientsImgUrl}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: ingredientsImgUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
            errorWidget: (context, _, __) =>
                Center(child: Icon(Icons.report_problem_outlined)),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: EatGoPalette.lineColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(ingredients),
        ),
      ],
    );
  }

  List<Column> buildRecipeExplainAndImgSets(List<Description> descriptions) {
    final validDescriptions = descriptions
        .where((desc) =>
            desc.description.isNotEmpty || desc.descriptionImgUrl.isNotEmpty)
        .toList();

    return List.generate(validDescriptions.length, (index) {
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
              child: Text(validDescriptions[index].description),
            ),
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: validDescriptions[index].descriptionImgUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
              errorWidget: (context, _, __) =>
                  Center(child: Icon(Icons.report_problem_outlined)),
            ),
          ),
          if (index != validDescriptions.length - 1) const SizedBox(height: 40),
        ],
      );
    });
  }

  Column buildCompletedRecipe(
      {required String title, required String completedImgUrl}) {
    return Column(
      children: [
        Text(
          '$title 완성!',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: completedImgUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
            errorWidget: (context, _, __) =>
                Center(child: Icon(Icons.report_problem_outlined)),
          ),
        ),
      ],
    );
  }
}
