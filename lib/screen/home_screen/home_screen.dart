import 'dart:math';

import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/animated_text_widget.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/drawer/home_screen_drawer.dart';
import 'package:eat_go/viewmodels/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final homeViewModel = ref.read(homeViewModelProvider.notifier);
    final isShaking = ref.watch(shakeProvider);
    final categories = ref.watch(categoriesProvider);
    final keywords = ref.watch(keywordsProvider);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: IconButton(
          onPressed: () {
            ref.read(shakeProvider.notifier).toggleShake();
          },
          icon: isShaking
              ? const Icon(Icons.lock_open, color: pointColor)
              : const Icon(Icons.lock, color: Colors.red),
        ),
        actions: [
          IconButton(
            iconSize: 40,
            color: pointColor,
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const HomeScreenDrawer(),
      floatingActionButton: Visibility(
        visible: isShaking,
        child: FloatingActionButton(
          onPressed: () {
            homeViewModel.fetchRandomRecipeWithRetry(
                categories: categories, keywords: keywords);
          },
          child: Icon(
            Icons.refresh,
            color: EatGoPalette.backgroundColor1,
            size: 45,
          ),
        ),
      ),
      body: ContentWidget(),
    );
  }
}

class ContentWidget extends ConsumerWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewState = ref.watch(homeViewModelProvider);
    return Align(
      alignment: const Alignment(0, -0.25),
      child: homeViewState.when(
        data: (randomRecipe) {
          bool beforeShaked = randomRecipe == null;
          if (beforeShaked) {
            return AnimatedTextWidget();
          } else {
            return RecipeWidget(
              randomRecipe: randomRecipe,
            );
          }
        },
        error: (error, stackTrace) => Text('$error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class RecipeWidget extends ConsumerStatefulWidget {
  const RecipeWidget({super.key, required this.randomRecipe});

  final Recipe randomRecipe;

  @override
  ConsumerState<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends ConsumerState<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(35),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 500,
                maxWidth: 500,
              ),
              child: Image.network(
                widget.randomRecipe.completedImgUrl,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    // 이미지가 정상적으로 로드되었을 때
                    return Stack(
                      children: [
                        child,
                        Positioned(
                          top: 15,
                          right: 15,
                          child: currentEatGoUser.when(
                            data: (user) {
                              if (user == null) {
                                debugPrint('HomeScreen - 사용자를 불러오지 못했습니다.');
                                return const Icon(Icons.report_problem_outlined);
                              }
                              final isBookmarked = user.bookmarkRecipeIds
                                  .contains(widget.randomRecipe.recipeId);
                              return GestureDetector(
                                onTap: () async {
                                  ref
                                      .read(homeViewModelProvider.notifier)
                                      .toggleBookmark(user);
                                },
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: EatGoPalette.backgroundColor1,
                                  child: Icon(
                                    isBookmarked == false
                                        ? Icons.bookmark_border_sharp
                                        : Icons.bookmark,
                                    color: pointColor,
                                    size: 30,
                                  ),
                                ),
                              );
                            },
                            error: (error, stackTrace) =>
                                const Icon(Icons.report_problem_outlined),
                            loading: () => const SizedBox(width: 0, height: 0),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // 로딩 중일 때, 진행률을 계산하고 표시
                    final progress = loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null;
          
                    return Center(
                        child: CircularProgressIndicator(value: progress));
                  }
                },
                errorBuilder: (_, __, ___) => Text('이미지가 없습니다.'),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          widget.randomRecipe.title, //포니언 스프
          style: const TextStyle(
            fontSize: 40,
            color: pointColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.go('/home/restaurant/${widget.randomRecipe.title}');
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: const BoxDecoration(
                  color: pointColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    '식당',
                    style: TextStyle(
                      color: EatGoPalette.backgroundColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.7,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                debugPrint('recipeId:${widget.randomRecipe.recipeId}');
                context
                    .go('/home/recipe_detail/${widget.randomRecipe.recipeId}');
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  color: EatGoPalette.backgroundColor1,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: pointColor,
                    width: 2.5,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '레시피',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.7,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
