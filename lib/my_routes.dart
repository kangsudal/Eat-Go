import 'package:eat_go/screen/about_this_app_screen.dart';
import 'package:eat_go/screen/all_recipe_list_screen.dart';
import 'package:eat_go/screen/bookmark_screen.dart';
import 'package:eat_go/screen/error_screen.dart';
import 'package:eat_go/screen/history_screen.dart';
import 'package:eat_go/screen/home_screen/home_screen.dart';
import 'package:eat_go/screen/my_recipe_screen.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:eat_go/screen/sign_in_screen.dart';
import 'package:eat_go/screen/yummy_treat_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: <RouteBase>[
        //홈화면에서 레시피 보기 버튼 눌렀을때
        goRouteRecipeDetail(),
        //Drawer - 전체
        GoRoute(
          path: 'all_recipe_list',
          builder: (BuildContext context, GoRouterState state) =>
              const AllRecipeListScreen(),
          routes: <RouteBase>[
            // 전체 - 각 레시피 타일 클릭했을때
            goRouteRecipeDetail(),
          ],
        ),
        //Drawer - 관심 항목
        GoRoute(
          path: 'bookmark',
          builder: (BuildContext context, GoRouterState state) =>
              const BookmarkScreen(),
          routes: <RouteBase>[
            // 관심 항목 - 각 레시피 타일 클릭했을때
            goRouteRecipeDetail(),
          ],
        ),
        //Drawer - 기록
        GoRoute(
          path: 'history',
          builder: (BuildContext context, GoRouterState state) =>
              const HistoryScreen(),
          routes: <RouteBase>[
            // 기록 - 각 레시피 타일 클릭했을때
            goRouteRecipeDetail(),
          ],
        ),
        //Drawer - 나의 레시피
        GoRoute(
          path: 'my_recipe',
          builder: (BuildContext context, GoRouterState state) =>
              const MyRecipeScreen(),
          routes: <RouteBase>[
            // 나의 레시피 - 각 레시피 타일 클릭했을때
            goRouteRecipeDetail(),
          ],
        ),
        //Drawer - BUY ME A YUMMY TREAT!(후원)
        GoRoute(
          path: 'yummy_treat',
          builder: (BuildContext context, GoRouterState state) =>
              const YummyTreatScreen(),
        ),
        //Drawer - BUY ME A YUMMY TREAT!(후원)
        GoRoute(
          path: 'about_this_app',
          builder: (BuildContext context, GoRouterState state) =>
              const AboutThisAppScreen(),
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

GoRoute goRouteRecipeDetail() {
  return GoRoute(
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
                return ErrorScreen(
                    error: 'Invalid recipe ID: ${e.toString()}');
              }
            },
          );
}
