import 'dart:async';

import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRecipeListViewModel extends AsyncNotifier<List<Recipe>> {
  late RecipeRepository _recipeRepository;
  late AuthRepository _authRepository;

  @override
  Future<List<Recipe>> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    _recipeRepository = ref.read(recipeRepositoryProvider);
    return await fetchMyRecipes();
  }

  // 레시피 목록을 서버에서 가져와 상태를 업데이트하는 메서드
  Future<List<Recipe>> fetchMyRecipes() async {
    state = const AsyncValue.loading();
    final String? currentUserUid = _authRepository.getCurrentUserUid();
    try {
      if (currentUserUid != null) {
        final recipes = await _recipeRepository.fetchRecipesByCreatedBy(
          createdBy: currentUserUid,
        );
        state = AsyncValue.data(recipes); // 성공 시 데이터 상태로 업데이트
        return recipes;
      } else {
        debugPrint('currentUserUid가 null입니다.');
        state =
            AsyncValue.error('현재 접속된 사용자를 불러오지 못하였습니다.', StackTrace.current);
        return [];
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        '데이터 로드 중 오류 발생: $e',
        stackTrace,
      ); // 실패 시 에러 상태로 업데이트
      rethrow;
    }
  }
}
