//API 통신, 데이터베이스 접근, 외부 서버와의 데이터 교환 등을 담당
//결과를 viewmodel를 통해 view에게 전달

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/repositories/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

class RecipeService {
  final RecipeRepository _recipeRepository = RecipeRepository();

  // 레시피 목록을 실시간으로 가져오는 Stream
  Stream<List<Recipe>> getRecipesStream() {
    return _recipeRepository.fetchRecipesStream();
  }

  // JSON 파일을 Firestore에 업로드
  Future<void> uploadJsonFile(String filePath, String collectionName) {
    return _recipeRepository.uploadJsonToFirestore(filePath, collectionName);
  }

  Future<List<Recipe>> getRecipesFuture() async {
    try {
      return _recipeRepository.fetchRecipesFuture();
    } catch (e) {
      debugPrint('레시피를 가져오는 중 오류 발생: $e');
      return [];
    }
  }
}
