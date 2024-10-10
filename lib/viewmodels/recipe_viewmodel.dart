/*
class WriteData {
  //final Firebase fbService;

  void upload() {
    // image thumbnail 생성
    // image 원본
    // fbService.upload(image1,thumbnail);
  }

  void delete() {
    // fbService.delete();
  }

  void change() {
    // data -> 가공,연산 -> 가공된결과
    // fbService.change(가공된 결과);
  }
  // +어떤 스크린이 어떤스크린이랑 데이터를 공유하는지 잘 분류해야한다.
}
*/
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeViewModel extends StateNotifier<AsyncValue<List<Recipe>>> {
  final RecipeService _recipeService;

  // 생성자에서 초기 상태를 '로딩 중'으로 설정
  RecipeViewModel(this._recipeService) : super(const AsyncValue.loading());

  // 레시피 목록을 서버에서 가져와 상태를 업데이트하는 메서드
  Future<void> fetchRecipes() async {
    try {
      final recipes = await _recipeService.getRecipesFuture();
      state = AsyncValue.data(recipes); // 성공 시 데이터 상태로 업데이트
    } catch (e, stackTrace) {
      state = AsyncValue.error(
          '데이터 로드 중 오류 발생: $e', stackTrace); // 실패 시 에러 상태로 업데이트
    }
  }

  // 레시피 목록 Stream
  Stream<List<Recipe>> recipesStream() {
    return _recipeService.getRecipesStream();
  }

  // JSON 파일을 Firestore에 업로드
  Future<void> uploadJsonFile(String filePath, String collectionName) async {
    try {
      await _recipeService.uploadJsonFile(filePath, collectionName);
    } catch (e, stackTrace) {
      state = AsyncValue.error('파일 업로드 중 오류 발생: $e', stackTrace); // 에러 발생 시
    }
  }

  // 레시피 목록 Future
  Future<List<Recipe>> recipesFuture() async {
    try {
      return await _recipeService.getRecipesFuture();
    } catch (e) {
      debugPrint('레시피 가져오는 중 오류 발생: $e');
      return [];
    }
  }
}
