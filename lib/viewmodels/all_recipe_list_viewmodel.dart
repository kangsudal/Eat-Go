import 'dart:async';

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRecipeListViewModel extends AsyncNotifier<List<Recipe>> {
  late final RecipeRepository _recipeRepository;

  @override
  Future<List<Recipe>> build() async {
    _recipeRepository = ref.read(recipeRepositoryProvider); // 의존성 주입
    return await fetchRecipes();
  }

  // 레시피 목록을 서버에서 가져와 상태를 업데이트하는 메서드
  Future<List<Recipe>> fetchRecipes() async {
    try {
      final recipes = await _recipeRepository.getRecipesFuture();
      state = AsyncValue.data(recipes); // 성공 시 데이터 상태로 업데이트
      return recipes;
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        '데이터 로드 중 오류 발생: $e',
        stackTrace,
      ); // 실패 시 에러 상태로 업데이트
      return [];
    }
  }

  // 레시피 목록 Stream
  Stream<List<Recipe>> recipesStream() {
    return _recipeRepository.getRecipesStream();
  }

  // JSON 파일을 Firestore에 업로드
  Future<void> uploadJsonFile(String filePath, String collectionName) async {
    try {
      await _recipeRepository.uploadJsonFile(filePath, collectionName);
    } catch (e, stackTrace) {
      state = AsyncValue.error('파일 업로드 중 오류 발생: $e', stackTrace); // 에러 발생 시
    }
  }

  Future<void> fetchFilteredRecipes({
    required Map<String, bool> categories,
    required String keywords,
  }) async {
    state = const AsyncValue.loading();

    try {
      List<Recipe>? recipeList;
      recipeList = await getFilteredRecipeListWithKeyword(
        categories: categories,
        keywords: keywords,
      );
      if (recipeList != null) {
        state = AsyncValue.data(recipeList);
      }
    } catch (e, stackTrace) {
      logger.e('AllRecipeListViewModel', error: e);
      state = AsyncValue.error(
        '조건에 맞는 레시피 리스트가 없습니다.',
        stackTrace,
      ); // 에러가 발생하면 에러 상태로 업데이트
    }
  }

  //필터하기
  Future<List<Recipe>?> getFilteredRecipeListWithKeyword({
    categories,
    keywords,
  }) async {
    state = const AsyncValue.loading();
    try {
      final List<Recipe>? recipeList =
          await _recipeRepository.getFilteredRecipeList(
        categories: categories,
        keywords: keywords,
      );
      if (recipeList != null) {
        state = AsyncValue.data(recipeList);
        return recipeList;
      }
    } catch (error, stackTrace) {
      logger.e('AllRecipeListViewModel - WithKeyword 에러 발생', error: error);
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
    state = AsyncValue.error('데이터를 불러오는데 문제가 생겼습니다.', StackTrace.current);
    return null;
  }
}
