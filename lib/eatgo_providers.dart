import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/viewmodels/recipe_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//RecipeService: 서버나 데이터베이스에서 데이터를 가져오는 역할
final recipeServiceProvider = Provider((ref) => RecipeService());

final recipeViewModelProvider =
    StateNotifierProvider<RecipeViewModel, AsyncValue<List<Recipe>>>(
  (ref) => RecipeViewModel(ref.watch(recipeServiceProvider)),
);
//RecipeViewModel: 레시피 목록을 서버에서 가져오거나, 로딩 중, 에러 상태를 처리함.
//StateNotifierProvider: View 화면에 전달하는 도구
