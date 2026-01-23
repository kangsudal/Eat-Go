import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/provider/user_providers.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/viewmodels/all_recipe_list_viewmodel.dart';
import 'package:eat_go/viewmodels/home_viewmodel.dart';
import 'package:eat_go/viewmodels/my_recipe_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_create_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_detail_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_edit_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// RecipeService Provider
final recipeServiceProvider = Provider(
  (ref) => RecipeService(firestore: ref.watch(firestoreProvider)),
);

/// RecipeRepository Provider
final recipeRepositoryProvider = Provider(
  (ref) => RecipeRepository(recipeService: ref.watch(recipeServiceProvider)),
);

/// 전체 레시피 목록 ViewModel Provider
final allRecipeListViewModelProvider =
    AsyncNotifierProvider<AllRecipeListViewModel, List<Recipe>>(
  AllRecipeListViewModel.new,
);

/// 홈화면 랜덤 레시피 ViewModel Provider
final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, Recipe?>(
  HomeViewModel.new,
);

/// 레시피 상세 ViewModel Provider (family 패턴)
final recipeDetailViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<RecipeDetailViewModel, Recipe, String>(
  RecipeDetailViewModel.new,
);

/// 레시피 작성 ViewModel Provider
final recipeCreateViewModelProvider =
    NotifierProvider<RecipeCreateViewModel, Recipe>(
  RecipeCreateViewModel.new,
);

/// 레시피 수정 ViewModel Provider
final recipeEditViewModelProvider =
    NotifierProvider<RecipeEditViewModel, Recipe>(
  RecipeEditViewModel.new,
);

/// 내 레시피 목록 ViewModel Provider
final myRecipeListViewModelProvider =
    AsyncNotifierProvider<MyRecipeListViewModel, List<Recipe>>(
  MyRecipeListViewModel.new,
);

/// 홈화면 - drawer 카테고리 필터
final homeScreenCategoriesProvider = StateProvider<Map<String, bool>>((ref) {
  return {
    '밥': true,
    '후식': true,
    '반찬': true,
    '일품': true,
    '국&찌개': true,
    '기타': true,
  };
});

/// 홈화면 - 키워드 필터
final homeScreenKeywordsProvider = StateProvider<String>((ref) => '');

/// 전체 레시피 페이지 - 카테고리 필터
final allRecipeListScreenCategoriesProvider =
    StateProvider<Map<String, bool>>((ref) {
  return {
    '밥': true,
    '후식': true,
    '반찬': true,
    '일품': true,
    '국&찌개': true,
    '기타': true,
  };
});

/// 전체 레시피 페이지 - 키워드 필터
final allRecipeListScreenKeywordsProvider = StateProvider<String>((ref) => '');
