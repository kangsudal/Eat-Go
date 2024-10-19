import 'dart:async';

import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AsyncNotifier<Recipe?> {
  late final RecipeRepository _recipeRepository;

  @override
  FutureOr<Recipe?> build() {
    _recipeRepository = ref.read(recipeRepositoryProvider);
    return null;
  }

  Future<Recipe?> getRandomRecipeByAutoId() async {
    try {
      return await _recipeRepository.getRandomRecipeByAutoId();
    } catch (e) {
      debugPrint('RecipeViewModel - 랜덤 doc ID 생성중 오류 발생 : $e');
      return null;
    }
  }
}
