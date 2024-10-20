import 'dart:async';

import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AsyncNotifier<Recipe?> {
  late final RecipeRepository _recipeRepository;
  late final AuthRepository _authRepository;
  late final UserRepository _userRepository;

  @override
  FutureOr<Recipe?> build() {
    _recipeRepository = ref.read(recipeRepositoryProvider);
    _authRepository = ref.read(authRepositoryProvider);
    _userRepository = ref.read(userRepositoryProvider);
    return null;
  }

  Future<Recipe?> getRandomRecipeByAutoId() async {
    try {
      Recipe? randomRecipe = await _recipeRepository.getRandomRecipeByAutoId();
      if (randomRecipe != null) {
        return randomRecipe;
      }
    } catch (e) {
      debugPrint('RecipeViewModel - 랜덤 doc ID 생성중 오류 발생 : $e');
      return null;
    }
    return null;
  }

  // 랜덤 레시피 가져오기 (결과가 없을 경우 재시도)
  Future<void> fetchRandomRecipeWithRetry({int maxRetries = 5}) async {
    state = const AsyncValue.loading(); // 로딩 상태로 변경
    int retries = 0;

    while (retries < maxRetries) {
      try {
        Recipe? recipe = await getRandomRecipeByAutoId();

        if (recipe != null) {
          state = AsyncValue.data(recipe); // 성공적으로 레시피를 가져오면 상태 업데이트
          return;
        }
        // recipe == null 이면 계속진행하여 retries++;로 간다.
      } catch (e, stackTrace) {
        debugPrint('HomeViewModel - $e');
        state = AsyncValue.error(e, stackTrace); // 에러가 발생하면 에러 상태로 업데이트
        return;
      }
      retries++;
    }

    // 최대 재시도 횟수를 초과하면 실패
    debugPrint('HomeViewModel - 최대 재시도 횟수를 초과');
    state = AsyncValue.error("레시피를 가져오지 못했습니다. 다시 시도해주세요.", StackTrace.current);
  }
}
