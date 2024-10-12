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
  // debugPrint('authState: $authState');

  // 로그를 통해 상태 추적
  authState.when(
    data: (user) {
      if (user != null) {
        debugPrint("User logged in: ${user.email}");
      } else {
        debugPrint("No user logged in");
      }
    },
    loading: () => debugPrint("Checking user authentication..."),
    error: (error, stackTrace) => debugPrint("Error in authState: $error"),
  );

  return GoRouter(
    initialLocation: '/loading',
    redirect: (context, state) {
      debugPrint('GoRouter redirect called, location: ${state.matchedLocation}');
      debugPrint('authState isLoading: ${authState.isLoading}');
      debugPrint('authState data: ${authState.asData?.value?.email}');
      // 인증 상태가 로딩 중일 때 로딩 화면으로 리디렉션
      if (authState.isLoading) {
        return '/loading';
      }

      // 인증 상태가 확인된 후 사용자 정보를 바탕으로 리디렉션
      final user = authState.asData?.value; // 로그인 상태 확인

      if ((user == null) && (state.matchedLocation != '/sign_in')) {
        debugPrint("로그인페이지로 가!");
        return '/sign_in'; // 로그인이 안 되어있으면 로그인 페이지로 이동
      }
      if ((user != null) && (state.matchedLocation == '/sign_in')) {
        debugPrint("로그인 했잖아. 홈페이지로 가!");
        return '/home'; // 로그인되어 있으면 홈 화면으로 이동
      }

      if (user != null && state.matchedLocation == '/loading') {
        debugPrint('사용자가 로그인된 상태인데 현재 경로가 /loading이면 홈으로 이동');
        return '/home';  // 홈 페이지로 리디렉션
      }

      return null; // 리디렉션이 필요 없으면 null 반환
    },
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
                return PathErrorScreen(
                    error: 'Invalid recipe ID: ID is missing');
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
      GoRoute(
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) => Scaffold(
          backgroundColor: Colors.red,
        ),
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
