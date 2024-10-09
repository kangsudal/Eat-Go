import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/viewmodels/recipe_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recipeServiceProvider = Provider((ref) => RecipeService());

//ViewModel을 상태 관리로 사용하기 위해 설정
final recipeViewModelProvider = StateNotifierProvider<RecipeViewModel, void>(
  (ref) => RecipeViewModel(ref.watch(recipeServiceProvider)),
);
