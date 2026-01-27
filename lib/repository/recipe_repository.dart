//API 통신, 데이터베이스 접근, 외부 서버와의 데이터 교환 등을 담당
//결과를 viewmodel를 통해 view에게 전달

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/services/recipe_cache_service.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/utils/app_logger.dart';

class RecipeRepository {
  RecipeRepository({
    required RecipeService recipeService,
    required RecipeCacheService cacheService,
  })  : _recipeService = recipeService,
        _cacheService = cacheService;

  final RecipeService _recipeService;
  final RecipeCacheService _cacheService;

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
      logger.e('레시피를 가져오는 중 오류 발생', error: e);
      return [];
    }
  }

  Future<List<Recipe>> getRecipesFutureByIds(
    List<String> bookmarkedRecipeIds,
  ) async {
    if (bookmarkedRecipeIds.isEmpty) {
      return [];
    }

    try {
      // 캐시에서 가져올 수 있는 레시피
      final cachedRecipes = _cacheService.getByIds(bookmarkedRecipeIds);
      final missingIds = _cacheService.getMissingIds(bookmarkedRecipeIds);

      // 캐시에 없는 레시피만 Firebase에서 가져옴
      if (missingIds.isEmpty) {
        return cachedRecipes;
      }

      final fetchedRecipes =
          await _recipeService.fetchRecipesFutureByIds(missingIds);

      // 새로 가져온 레시피를 캐시에 저장
      _cacheService.setAll(fetchedRecipes);

      // 캐시된 레시피와 새로 가져온 레시피를 합쳐서 반환
      return [...cachedRecipes, ...fetchedRecipes];
    } catch (e) {
      logger.e('레시피를 가져오는 중 오류 발생', error: e);
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
      logger.e('RecipeRepository - 랜덤 레시피 생성중(keyword 없이) 오류 발생', error: e);
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
        categories: categories,
        keywords: keywords,
      );
    } catch (e) {
      logger.e('RecipeRepository - 랜덤 레시피 생성중 오류 발생', error: e);
      return null;
    }
  }

  //전체 레시피 페이지 사용(필터)
  Future<List<Recipe>?> getFilteredRecipeList({
    categories,
    keywords,
  }) async {
    try {
      final List<Recipe>? recipeList =
          await _recipeService.getFilteredRecipeList(
        categories: categories,
        keywords: keywords,
      );
      if (recipeList != null) {
        return recipeList;
      }
    } catch (e) {
      logger.e('RecipeRepository - getFilteredRecipeList 에러 발생', error: e);
      return null;
    }
    return null;
  }

  Future<Recipe> getRecipeById({required String recipeId}) async {
    // 캐시 확인
    final cachedRecipe = _cacheService.get(recipeId);
    if (cachedRecipe != null) {
      return cachedRecipe;
    }

    try {
      final recipe = await _recipeService.getRecipeById(recipeId: recipeId);
      // 캐시에 저장
      _cacheService.set(recipeId, recipe);
      return recipe;
    } catch (e) {
      logger.e('RecipeRepository - 레시피 조회 중 오류 발생', error: e);
      throw Exception(e);
    }
  }

  Future<bool> updateRecipeData({required Recipe updatedRecipe}) async {
    try {
      await _recipeService.updateRecipeData(updatedRecipe: updatedRecipe);
      // 캐시 업데이트
      _cacheService.set(updatedRecipe.recipeId, updatedRecipe);
      return true;
    } catch (e) {
      logger.e('RecipeRepository - 레시피 업데이트 중 오류가 발생하였습니다', error: e);
      return false;
    }
  }

  Future<List<Recipe>> fetchRecipesByCreatedBy({
    required String createdBy,
  }) async {
    try {
      return _recipeService.fetchRecipesByCreatedBy(createdBy: createdBy);
    } catch (e) {
      logger.e('레시피를 가져오는 중 오류 발생', error: e);
      return [];
    }
  }
}
