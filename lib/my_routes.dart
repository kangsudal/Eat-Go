import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/screen/about_this_app_screen.dart';
import 'package:eat_go/screen/all_recipe_list_screen.dart';
import 'package:eat_go/screen/success_withdrawal_screen.dart';
import 'package:eat_go/screen/bookmark_screen.dart';
import 'package:eat_go/screen/path_error_screen.dart';
import 'package:eat_go/screen/history_screen.dart';
import 'package:eat_go/screen/home_screen/home_screen.dart';
import 'package:eat_go/screen/my_recipe_screen.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:eat_go/screen/restaurant_screen/restaurant_screen.dart';
import 'package:eat_go/screen/setting_screen.dart';
import 'package:eat_go/screen/sign_in_screen.dart';
import 'package:eat_go/screen/yummy_treat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final myRouterProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider); // 로그인 상태(AsyncValue<User?>)
  debugPrint('authState: $authState');
  return GoRouter(
    initialLocation: authState.when(
      data: (user) => user != null ? '/home' : '/sign_in',
      loading: () => '/loading', // 로딩 중에도 로그인 페이지로 대체
      error: (_, __) => '/sign_in', // 에러 발생 시 로그인 페이지로 이동
    ),
    redirect: (context, state) {
      if (authState is AsyncLoading) {
        return null; // 로딩 중일 때는 리디렉션하지 않음
      }

      final user =
          authState.maybeWhen(data: (user) => user, orElse: () => null);
      debugPrint("user:$user");
      final currentLocation = state.uri.toString(); // 현재 경로

      // 로그인되지 않았고, 로그인 페이지가 아니면 로그인 페이지로 리디렉션
      if (user == null && currentLocation != '/sign_in') {
        return '/sign_in';
      }

      // 로그인 상태인데 로그인 페이지로 가려고 하면 홈으로 리디렉션
      if (user != null && currentLocation == '/sign_in') {
        return '/home';
      }
      return null; // 리디렉션하지 않을 경우 null을 반환
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (BuildContext context, GoRouterState state) =>
            const SignInScreen(),
      ),
      GoRoute(
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) => const Scaffold(
            body: Center(child: CircularProgressIndicator())), // 로딩 화면
      ),
    ],
    errorBuilder: (context, state) =>
        PathErrorScreen(error: state.error.toString()),
  );
});

GoRoute goRouteRecipeDetail() {
  return GoRoute(
    path: 'recipe_detail/:recipe_id',
    builder: (BuildContext context, GoRouterState state) {
      String? recipeIdString = state.pathParameters['recipe_id'];
      if (recipeIdString == null) {
        // recipe_id가 없는 경우 에러 화면으로
        return PathErrorScreen(error: 'Invalid recipe ID: ID is missing');
      }
      return RecipeDetailScreen(recipeId: recipeIdString);
    },
    routes: <RouteBase>[
      //레시피 상세보기화면에서 식당 버튼 눌렀을때
      GoRoute(
          path: 'restaurant',
          builder: (BuildContext context, GoRouterState state) {
            String? recipeIdString = state.pathParameters['recipe_id'];
            if (recipeIdString == null) {
              // recipe_id가 없는 경우 에러 화면으로
              return PathErrorScreen(error: 'Invalid recipe ID: ID is missing');
            }
            return RestaurantScreen(
              recipeId: recipeIdString,
            );
          }),
    ],
  );
}
