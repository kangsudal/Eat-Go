//API 통신, 데이터베이스 접근, 외부 서버와의 데이터 교환 등을 담당
//결과를 viewmodel를 통해 view에게 전달

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:flutter/cupertino.dart';

class RecipeRepository {
  final RecipeService _recipeService;

  RecipeRepository({required RecipeService recipeService})
      : _recipeService = recipeService;

  // 레시피 목록을 실시간으로 가져오는 Stream
  Stream<List<Recipe>> getRecipesStream() {
    return _recipeService.fetchRecipesStream();
  }

  // JSON 파일을 Firestore에 업로드
  Future<void> uploadJsonFile(String filePath, String collectionName) {
    return _recipeService.uploadJsonToFirestore(filePath, collectionName);
  }

  Future<List<Recipe>> getRecipesFuture() async {
    try {
      return _recipeService.fetchRecipesFuture();
    } catch (e) {
      debugPrint('레시피를 가져오는 중 오류 발생: $e');
      return [];
    }
  }

  Future<List<Recipe>> getRecipesFutureByIds(
      List<String> bookmarkedRecipeIds) async {
    try {
      return _recipeService.fetchRecipesFutureByIds(bookmarkedRecipeIds);
    } catch (e) {
      debugPrint('레시피를 가져오는 중 오류 발생: $e');
      return [];
    }
  }

  Future<Recipe?> getRandomRecipeByAutoId() async {
    try {
      return _recipeService.getRandomRecipeByAutoId();
    } catch (e) {
      debugPrint('RecipeRepository - 랜덤 레시피 생성중 오류 발생 : $e');
      return null;
    }
  }

  Future<Recipe> getRecipeById({required String recipeId}) async {
    try {
      return _recipeService.getRecipeById(recipeId: recipeId);
    } catch (e) {
      debugPrint('RecipeRepository - 레시피 생성중 오류 발생 : $e');
      throw Exception(e);
    }
  }
}
