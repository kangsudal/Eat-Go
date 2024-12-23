import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/shake_notifier.dart';
import 'package:eat_go/repository/restaurant_repository.dart';
import 'package:eat_go/services/auth_service.dart';
import 'package:eat_go/services/location_service.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/services/restaurant_service.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/recipe_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:eat_go/viewmodels/bookmark_viewmodel.dart';
import 'package:eat_go/viewmodels/home_viewmodel.dart';
import 'package:eat_go/provider/current_eatgo_user_notifier.dart';
import 'package:eat_go/viewmodels/my_recipe_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_create_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_detail_viewmodel.dart';
import 'package:eat_go/viewmodels/all_recipe_list_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_edit_viewmodel.dart';
import 'package:eat_go/viewmodels/restaurant_viewmodel.dart';
import 'package:eat_go/viewmodels/sign_in_viewmodel.dart';
import 'package:eat_go/viewmodels/setting_viewmodel.dart';
import 'package:eat_go/viewmodels/recipe_write_base_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

//Provider: 간단한 의존성 주입 도구로, 특정 클래스를 전역적으로 쉽게 사용할 수 있도록 만들어줍니다.
final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

//<모든 레시피 목록 가져오기>
//RecipeService: 서버나 데이터베이스에서 데이터를 가져오는 역할
final recipeServiceProvider =
    Provider((ref) => RecipeService(firestore: ref.watch(firestoreProvider)));
final recipeRepositoryProvider = Provider(
    (ref) => RecipeRepository(recipeService: ref.watch(recipeServiceProvider)));
final allRecipeListViewModelProvider =
    AsyncNotifierProvider<AllRecipeListViewModel, List<Recipe>>(
        AllRecipeListViewModel.new);
//RecipeViewModel: 레시피 목록을 서버에서 가져오거나, 로딩 중, 에러 상태를 처리함.
//StateNotifierProvider: View 화면에 전달하는 도구

//<회원가입/로그인>
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
// Firebase Auth의 로그인 상태를 추적하는 Provider
final authStateProvider = StreamProvider<User?>((ref) async* {
  final auth = ref.read(authProvider); // FirebaseAuth 인스턴스
  try {
    //User 정보 강제로 새로고침(콘솔에서 강제삭제한경우 남아있기때문)
    if (auth.currentUser != null) {
      await auth.currentUser?.reload();
    }
  } catch (e) {
    debugPrint('User 정보 reload 하는데 에러 발생: $e');
  }
  yield* auth.authStateChanges().handleError((error) {
    debugPrint("Error in authStateChanges: $error");
  }); // 로그인 상태 변경 스트림 반환
});

// AuthService Provider(인증 관련 서비스 제공) : 로그인/로그아웃과 같은 인증 관련 로직
final authServiceProvider =
    Provider<AuthService>((ref) => AuthService(auth: ref.watch(authProvider)));
final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepository(authService: ref.watch(authServiceProvider)));
// AuthRepository: 인증을 처리하는 역할 (예: 로그인, 로그아웃, fireauth에서 계정 삭제).

// UserRepository Provider(데이터베이스와 상호작용) : Firebase Firestore와 상호작용
final userServiceProvider =
    Provider<UserService>((ref) => UserService(firestore: ref.watch(firestoreProvider)));

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(userService: ref.watch(userServiceProvider)));
// UserRepository: 사용자 데이터를 다루는 역할 (auth에 저장 못하는 사용자 정보(Apple email, bookmarks) 저장, 불러오기, 업데이트).

// SignInViewModel Provider
final signInViewModelProvider =
    AsyncNotifierProvider<SignInViewModel, void>(SignInViewModel.new);

//<탈퇴>
// SettingViewModel Provider (UserService 주입)
final settingViewModelProvider =
    AsyncNotifierProvider.autoDispose<SettingViewModel, EatGoUser?>(
        SettingViewModel.new);

//<홈화면 랜덤레시피>
final homeViewModelProvider =
    AsyncNotifierProvider<HomeViewModel, Recipe?>(HomeViewModel.new);

//<홈화면, 관심항목 페이지, 기록 페이지 등에 사용>
final currentEatGoUserProvider =
    AsyncNotifierProvider<CurrentEatGoUserNotifier, EatGoUser?>(
        CurrentEatGoUserNotifier.new);

//<관심항목 페이지>
final bookmarkViewModelProvider =
    AsyncNotifierProvider.family<BookmarkViewModel, List<Recipe>?, EatGoUser?>(
        BookmarkViewModel.new);

//<상세 페이지>
////https://riverpod.dev/docs/migration/from_state_notifier#explicit-family-and-autodispose-modifications
final recipeDetailViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<RecipeDetailViewModel, Recipe, String>(
        RecipeDetailViewModel.new);

//<흔들기 기능>
final shakeProvider = NotifierProvider<ShakeNotifier, bool>(ShakeNotifier.new);

//<식당찾기 페이지>
// 위치 권한 및 GPS 상태 모니터링
final locationServiceStatusProvider = StreamProvider.autoDispose<bool>((ref) {
  return LocationService.locationServiceStatusStream();
});

final restaurantViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<RestaurantViewModel, List<Restaurant>, String>(
        RestaurantViewModel.new);

final restaurantRepositoryProvider = Provider(
  (ref) => RestaurantRepository(
    restaurantService: RestaurantService(),
  ),
);

// <홈화면 - drawer 필터>
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

final homeScreenKeywordsProvider = StateProvider<String>((ref) => '');

//<전체 페이지 - 필터>
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

final allRecipeListScreenKeywordsProvider = StateProvider<String>((ref) => '');

//<나의 레시피 작성하기 페이지>
//첫 포스팅
final recipeCreateViewModelProvider =
    NotifierProvider<RecipeCreateViewModel, Recipe>(RecipeCreateViewModel.new);
//포스팅 수정
final recipeEditViewModelProvider =
    NotifierProvider<RecipeEditViewModel, Recipe>(RecipeEditViewModel.new);

//<나의 레시피 페이지(목록)>
final myRecipeListViewModelProvider =
    AsyncNotifierProvider<MyRecipeListViewModel, List<Recipe>>(
        MyRecipeListViewModel.new);
