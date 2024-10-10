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
import 'package:go_router/go_router.dart';

final GoRouter myRouter = GoRouter(
  initialLocation: '/sign_in',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: <RouteBase>[
        //홈화면에서 식당 버튼 눌렀을때
        GoRoute(
          path: 'restaurant/:recipe_id',
          builder: (BuildContext context, GoRouterState state) {
            String? recipeIdString = state.pathParameters['recipe_id'];
            if (recipeIdString == null) {
              // recipe_id가 없는 경우 에러 화면으로
              return PathErrorScreen(error: 'Invalid recipe ID: ID is missing');
            }
            return RestaurantScreen(recipeId: recipeIdString);
          },
        ),
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
        //Drawer - ABOUT THIS APP
        GoRoute(
          path: 'about_this_app',
          builder: (BuildContext context, GoRouterState state) =>
              const AboutThisAppScreen(),
        ),
        //Drawer - SETTING
        GoRoute(
          path: 'setting',
          builder: (BuildContext context, GoRouterState state) =>
              const SettingScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/sign_in',
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
    GoRoute(
      path: '/success_withdrawal',
      builder: (BuildContext context, GoRouterState state) =>
          SuccessWithdrawalScreen(),
    ),
  ],
  errorBuilder: (context, state) => PathErrorScreen(error: state.error.toString()),
);

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
