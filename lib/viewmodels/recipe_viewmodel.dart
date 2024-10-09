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
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeViewModel extends StateNotifier<void> {
  final RecipeService _recipeService;

  RecipeViewModel(this._recipeService) : super(null);

  // 레시피 목록 Stream
  Stream<List<Recipe>> get recipesStream => _recipeService.getRecipesStream();

  // JSON 파일을 Firestore에 업로드
  Future<void> uploadJsonFile(String filePath, String collectionName) async {
    try {
      await _recipeService.uploadJsonFile(filePath, collectionName);
    } catch (e) {
      print('파일 업로드 중 오류 발생: $e');
    }
  }
}
