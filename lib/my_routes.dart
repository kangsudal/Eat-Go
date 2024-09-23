import 'package:eat_go/screen/error_screen.dart';
import 'package:eat_go/screen/home_screen/home_screen.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:eat_go/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'recipe_detail/:recipe_id',
          builder: (BuildContext context, GoRouterState state) {
            print('b');
            String? recipeIdString = state.pathParameters['recipe_id'];
            if (recipeIdString == null) {
              // recipe_id가 없는 경우 에러 화면으로
              return ErrorScreen(error: 'Invalid recipe ID: ID is missing');
            }

            try {
              final recipeId = int.parse(recipeIdString); // 문자열을 숫자로 변환 시도
              return RecipeDetailScreen(recipeId: recipeId);
            } catch (e) {
              // 숫자로 변환할 수 없으면 예외 처리
              return ErrorScreen(error: 'Invalid recipe ID: ${e.toString()}');
            }
          },
        ),
      ],
    ),
    GoRoute(
      path: '/sign_in',
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
);
