import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/repositories/user_repository.dart';
import 'package:eat_go/services/auth_service.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:eat_go/viewmodels/recipe_viewmodel.dart';
import 'package:eat_go/viewmodels/sign_in_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider: 간단한 의존성 주입 도구로, 특정 클래스를 전역적으로 쉽게 사용할 수 있도록 만들어줍니다.

//RecipeService: 서버나 데이터베이스에서 데이터를 가져오는 역할
final recipeServiceProvider = Provider((ref) => RecipeService());

final recipeViewModelProvider =
    StateNotifierProvider<RecipeViewModel, AsyncValue<List<Recipe>>>(
  (ref) => RecipeViewModel(ref.watch(recipeServiceProvider)),
);
//RecipeViewModel: 레시피 목록을 서버에서 가져오거나, 로딩 중, 에러 상태를 처리함.
//StateNotifierProvider: View 화면에 전달하는 도구

// AuthService Provider(인증 관련 서비스 제공) : 로그인/로그아웃과 같은 인증 관련 로직
final authServiceProvider = Provider((ref) => AuthService());

// UserRepository Provider(데이터베이스와 상호작용) : Firebase Firestore와 상호작용
final userRepositoryProvider =
    Provider((ref) => UserRepository(firestore: FirebaseFirestore.instance));

// UserService Provider : 사용자 데이터를 저장하거나 불러오는 작업
final userServiceProvider = Provider(
    (ref) => UserService(userRepository: ref.read(userRepositoryProvider)));

// SignInViewModel Provider
final signInViewModelProvider = Provider((ref) => SignInViewModel(
      authService: ref.read(authServiceProvider),
      userService: ref.read(userServiceProvider),
    ));
