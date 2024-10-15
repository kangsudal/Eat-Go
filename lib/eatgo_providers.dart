import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/operation_result.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/services/auth_service.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:eat_go/viewmodels/recipe_viewmodel.dart';
import 'package:eat_go/viewmodels/sign_in_viewmodel.dart';
import 'package:eat_go/viewmodels/setting_viewmodel.dart';
import 'package:eat_go/viewmodels/success_withdrawal_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider: 간단한 의존성 주입 도구로, 특정 클래스를 전역적으로 쉽게 사용할 수 있도록 만들어줍니다.

//<모든 레시피 목록 가져오기>
//RecipeService: 서버나 데이터베이스에서 데이터를 가져오는 역할
final recipeRepositoryProvider = Provider((ref) => RecipeRepository());

final recipeViewModelProvider =
    AsyncNotifierProvider<RecipeViewModel, List<Recipe>>(RecipeViewModel.new);
//RecipeViewModel: 레시피 목록을 서버에서 가져오거나, 로딩 중, 에러 상태를 처리함.
//StateNotifierProvider: View 화면에 전달하는 도구

//<회원가입/로그인>
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
// Firebase Auth의 로그인 상태를 추적하는 Provider
final authStateProvider = StreamProvider<User?>((ref) {
  final auth = ref.read(authProvider); // FirebaseAuth 인스턴스
  return auth.authStateChanges().handleError((error) {
    debugPrint("Error in authStateChanges: $error");
  }); // 로그인 상태 변경 스트림 반환
});

// AuthService Provider(인증 관련 서비스 제공) : 로그인/로그아웃과 같은 인증 관련 로직
final authRepositoryProvider =
    Provider((ref) => AuthRepository(auth: ref.watch(authProvider)));

final authServiceProvider =
    Provider((ref) => AuthService(auth: ref.watch(authProvider)));
// UserRepository Provider(데이터베이스와 상호작용) : Firebase Firestore와 상호작용
final userServiceProvider =
    Provider((ref) => UserService(firestore: FirebaseFirestore.instance));

final userRepositoryProvider = Provider((ref) => UserRepository(
      userService: ref.read(userServiceProvider), // 상태가 변경되어도 다시 읽을 필요 없음
      authService: ref.watch(authServiceProvider), // 상태가 변경되면 자동으로 반응
    ));
// UserRepository: 사용자 데이터를 다루는 역할 (예: 사용자 정보 불러오기, 업데이트).
// AuthRepository: 인증을 처리하는 역할 (예: 로그인, 로그아웃).
// UserService: 이 두 가지를 사용해서, 사용자와 관련된 작업을 모두 처리하는 서비스.

// SignInViewModel Provider
final signInViewModelProvider =
    AsyncNotifierProvider<SignInViewModel, void>(SignInViewModel.new);

//<탈퇴>
// SettingViewModel Provider (UserService 주입)
final settingViewModelProvider =
    AsyncNotifierProvider<SettingViewModel, OperationResult<bool>>(SettingViewModel.new);
final withdrawalViewModelProvider =
    AsyncNotifierProvider<SuccessWithdrawalViewModel, OperationResult<bool>>(SuccessWithdrawalViewModel.new);
