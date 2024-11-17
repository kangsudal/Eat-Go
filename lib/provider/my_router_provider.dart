import 'package:eat_go/screen/about_this_app_screen.dart';
import 'package:eat_go/screen/admin_screen.dart';
import 'package:eat_go/screen/all_recipe_list_screen.dart';
import 'package:eat_go/screen/bookmark_screen.dart';
import 'package:eat_go/screen/history_screen.dart';
import 'package:eat_go/screen/home_screen/home_screen.dart';
import 'package:eat_go/screen/my_recipe_list_screen.dart';
import 'package:eat_go/screen/path_error_screen.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:eat_go/screen/restaurant_screen/restaurant_screen.dart';
import 'package:eat_go/screen/setting_screen.dart';
import 'package:eat_go/screen/sign_in_screen.dart';
import 'package:eat_go/screen/yummy_treat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'eatgo_providers.dart';

final myRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider); // 로그인 상태(AsyncValue<User?>)
  // debugPrint('authState: $authState');

  // 로그를 통해 상태 추적
  final user = authState.when(
    data: (user) {
      if (user != null) {
        debugPrint("User logged in: ${user.email}");
      } else {
        debugPrint("No user logged in");
      }
      return user;
    },
    loading: () {
      debugPrint("Checking user authentication...");
      return null; // 로딩 중에는 사용자 데이터가 없으므로 null 반환
    },
    error: (error, stackTrace) {
      debugPrint("Error in authState: $error");
      return null; // 에러 발생 시도 null로 처리
    },
  );

  final router = GoRouter(
    initialLocation: '/home', //'/admin',//
    redirect: (context, state) {
      // if (kDebugMode) {
      //   // 디버깅 모드에서는 항상 /admin으로 접근 가능하게 설정
      //   return null;
      // }
      // debugPrint('GoRouter redirect called, location: ${state.matchedLocation}');
      // debugPrint('authState isLoading: ${authState.isLoading}');
      // debugPrint('authState data: ${authState.asData?.value?.email}');
      // 인증 상태가 로딩 중일 때 로딩 화면으로 리디렉션
      if (authState.isLoading) {
        return '/loading';
      }

      //todo: 에러 페이지 만들어주기
      // 에러가 발생했을 때도 로딩 화면이나 에러 페이지로 리디렉션
      if (authState.hasError) {
        debugPrint('Authentication error occurred: ${authState.error}');
        return '/sign_in'; // 예시로 로그인 화면으로 보내도록 처리
      }

      // 로그인이 필요한 페이지 접근 시 리디렉션
      final loggedInRequiredRoutes = [
        '/home/all_recipe_list',
        '/home/bookmark',
        '/home/my_recipe_list',
        '/home/setting',
      ];

      if (user == null &&
          loggedInRequiredRoutes.contains(state.matchedLocation)) {
        return '/sign_in'; // 로그인이 안 되어 있고 로그인이 필요한 페이지 접근할 경우 로그인 페이지로 리디렉션
      }

      if ((user != null) && (state.matchedLocation == '/sign_in')) {
        // debugPrint("로그인 했잖아. 홈페이지로 가!");
        return '/home'; // 로그인되어 있으면 홈 화면으로 이동
      }

      if (user != null && state.matchedLocation == '/loading') {
        // debugPrint('사용자가 로그인된 상태인데 현재 경로가 /loading이면 홈으로 이동');
        return '/home'; // 홈 페이지로 리디렉션
      }

      // 홈화면이 아닌곳에가면 흔들기 감지 기능이 꺼지게
      if (state.matchedLocation != '/home') {
        WidgetsBinding.instance.addPostFrameCallback((duration) {
          ref.watch(shakeProvider.notifier).disableShake();
        });
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
            path: 'restaurant/:recipe_title',
            builder: (BuildContext context, GoRouterState state) {
              String? recipeTitle = state.pathParameters['recipe_title'];
              if (recipeTitle == null) {
                // recipe_title가 없는 경우 에러 화면으로
                return PathErrorScreen(
                    error: 'Invalid recipe Title: Title is missing');
              }
              return RestaurantScreen(recipeTitle: recipeTitle);
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
            path: 'my_recipe_list',
            builder: (BuildContext context, GoRouterState state) =>
                const MyRecipeListScreen(),
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
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      GoRoute(
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) =>
            const AdminScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        PathErrorScreen(error: state.error.toString()),
  );

  // authStateProvider의 상태 변화를 감지하여 GoRouter를 갱신
  ref.listen<AsyncValue<User?>>(
    authStateProvider,
    (previous, next) {
      router.refresh(); // 상태 변경 시 라우터 새로고침
    },
  );

  return router;
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
          path: 'restaurant/:recipe_title',
          builder: (BuildContext context, GoRouterState state) {
            String? recipeTitle = state.pathParameters['recipe_title'];
            if (recipeTitle == null) {
              // recipe_title가 없는 경우 에러 화면으로
              return PathErrorScreen(
                  error: 'Invalid recipe Title: Title is missing');
            }
            return RestaurantScreen(
              recipeTitle: recipeTitle,
            );
          }),
    ],
  );
}
