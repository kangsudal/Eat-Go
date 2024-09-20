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

/*
chatgpt의 예시:
recipe_viewmodel.dart

import 'package:flutter/material.dart';
import 'package:your_project/models/recipe_model.dart';
import 'package:your_project/services/recipe_service.dart';

class RecipeViewModel extends ChangeNotifier {
  List<Recipe> recipes = []; //viewmodel은 오브젝트 단위로 묶은 데이터들을 Provider나 riverpod을 통해 관리해주는 상태변수같다.

  Future<void> fetchRecipes() async {
    recipes = await RecipeService().getRecipes();
    notifyListeners();  // View 업데이트
  }
}
 */