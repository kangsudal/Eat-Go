import 'package:eat_go/model/description_model.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WriteViewModel extends Notifier<Recipe> {
  @override
  Recipe build() {
    return Recipe(
      recipeId: '',
      title: '',
      ingredients: '',
      ingredientsImgUrl: '',
      descriptions: [],
      category: '',
      hashTag: '',
      completedImgUrl: '',
      createdAt: DateTime.now(),
      createdBy: '',
      updatedAt: DateTime.now(),
      clapRecords: [],
      bookmarkedBy: [],
      viewedBy: [],
    );
  }

  void updateTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }

  void updateCategory(String newCategory) {
    state = state.copyWith(category: newCategory);
  }

  void updateIngredients(String newIngredients) {
    state = state.copyWith(ingredients: newIngredients);
  }

  void addDescription(Description description) {
    state = state.copyWith(descriptions: [...state.descriptions, description]);
  }

  void updateCompletedImgUrl(String url) {
    state = state.copyWith(completedImgUrl: url);
  }

  String? validateTitle(String title) {
    if (title.isEmpty) {
      return '제목을 써주세요';
    }
    if (title.length < 3) {
      return '제목은 최소 세글자 입니다.';
    }
    return null;
  }

  String? validateIngredients(String ingredients) {
    if (ingredients.isEmpty) {
      return '재료를 써주세요.';
    }
    return null;
  }
}
