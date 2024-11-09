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

  //홈 화면
  Future<Recipe?> getFilteredRandomRecipeWithoutKeyword({
    required Map<String, dynamic> categories,
  }) async {
    try {
      return _recipeService.getFilteredRandomRecipeWithoutKeywords(
        categories: categories,
      );
    } catch (e) {
      debugPrint('RecipeRepository - 랜덤 레시피 생성중(keyword 없이) 오류 발생 : $e');
      return null;
    }
  }

  //홈화면
  Future<Recipe?> getFilteredRandomRecipeWithKeyword({
    required Map<String, dynamic> categories,
    required String keywords,
  }) async {
    try {
      return _recipeService.getFilteredRandomRecipeWithKeywords(
          categories: categories, keywords: keywords);
    } catch (e) {
      debugPrint('RecipeRepository - 랜덤 레시피 생성중 오류 발생 : $e');
      return null;
    }
  }

  //전체 레시피 페이지 사용(필터)
  Future<List<Recipe>?> getFilteredRecipeList({
    categories,
    keywords,
  }) async {
    try {
      List<Recipe>? recipeList = await _recipeService.getFilteredRecipeList(
          categories: categories, keywords: keywords);
      if (recipeList != null) {
        return recipeList;
      }
    } catch (e) {
      debugPrint('RecipeRepository - getFilteredRecipeList 에러 발생:$e');
      return null;
    }
    return null;
  }

  Future<Recipe> getRecipeById({required String recipeId}) async {
    try {
      return _recipeService.getRecipeById(recipeId: recipeId);
    } catch (e) {
      debugPrint('RecipeRepository - 레시피 생성중 오류 발생 : $e');
      throw Exception(e);
    }
  }

  Future<bool> updateRecipeData({required Recipe updatedRecipe}) async {
    try {
      await _recipeService.updateRecipeData(updatedRecipe: updatedRecipe);
      return true;
    } catch (e) {
      debugPrint('RecipeRepository - 레시피 업데이트 중 오류가 발생하였습니다. $e');
      return false;
    }
  }

  Future<List<Recipe>> fetchRecipesByCreatedBy({required String createdBy}) async {
    try {
      return _recipeService.fetchRecipesByCreatedBy(createdBy: createdBy);
    } catch (e) {
      debugPrint('레시피를 가져오는 중 오류 발생: $e');
      return [];
    }
  }
}
