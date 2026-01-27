import 'package:cached_network_image/cached_network_image.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/animated_text_widget.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/drawer/home_screen_drawer.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/need_sign_in_dialog.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _HomeAppBar(scaffoldKey: _scaffoldKey),
      endDrawer: const HomeScreenDrawer(),
      floatingActionButton: const _HomeFloatingActionButton(),
      body: const _HomeBody(),
    );
  }
}

/// AppBar 위젯 - shakeProvider와 currentEatGoUserProvider만 watch
class _HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _HomeAppBar({required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShaking = ref.watch(shakeProvider);
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);

    return AppBar(
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
        currentEatGoUser.when(
          data: (user) {
            if (user != null) {
              return IconButton(
                iconSize: 40,
                color: pointColor,
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              );
            } else {
              return IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NeedSignInDialog();
                    },
                  );
                },
                icon: const Icon(
                  Icons.person,
                  color: pointColor,
                ),
              );
            }
          },
          error: (error, stackTrace) {
            return const Center(
              child: Icon(Icons.report_problem_outlined),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

/// FloatingActionButton 위젯 - categories와 keywords만 watch
class _HomeFloatingActionButton extends ConsumerWidget {
  const _HomeFloatingActionButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(homeScreenCategoriesProvider);
    final keywords = ref.watch(homeScreenKeywordsProvider);

    return FloatingActionButton(
      onPressed: () {
        ref.read(homeViewModelProvider.notifier).fetchRandomRecipeWithRetry(
              categories: categories,
              keywords: keywords,
            );
      },
      child: Icon(
        Icons.refresh,
        color: EatGoPalette.backgroundColor1,
        size: 45,
      ),
    );
  }
}

/// Body 위젯 - homeViewModelProvider와 currentEatGoUserProvider만 watch
class _HomeBody extends ConsumerWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);

    return ContentWidget(currentEatGoUser: currentEatGoUser);
  }
}

class ContentWidget extends ConsumerWidget {
  const ContentWidget({super.key, required this.currentEatGoUser});

  final AsyncValue<EatGoUser?> currentEatGoUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewState = ref.watch(homeViewModelProvider);
    return Align(
      alignment: const Alignment(0, -0.25),
      child: homeViewState.when(
        data: (randomRecipe) {
          final bool beforeShaked = randomRecipe == null;
          if (beforeShaked) {
            return const AnimatedTextWidget();
          } else {
            return RecipeWidget(
              randomRecipe: randomRecipe,
              currentEatGoUser: currentEatGoUser,
            );
          }
        },
        error: (error, stackTrace) => Align(
          alignment: const Alignment(0, -0.3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/memo-no-result.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              Text('$error'),
            ],
          ),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class RecipeWidget extends ConsumerWidget {
  const RecipeWidget({
    super.key,
    required this.randomRecipe,
    required this.currentEatGoUser,
  });

  final Recipe randomRecipe;
  final AsyncValue<EatGoUser?> currentEatGoUser;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: CachedNetworkImage(
                imageUrl: randomRecipe.completedImgUrl,
                fit: BoxFit.contain,
                memCacheHeight: 500,
                memCacheWidth: 500,
                imageBuilder: (context, imageProvider) {
                  return Stack(
                    children: [
                      Image(image: imageProvider, fit: BoxFit.contain),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: currentEatGoUser.when(
                          data: (user) {
                            if (user == null) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const NeedSignInDialog();
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: EatGoPalette.backgroundColor1,
                                  child: const Icon(
                                    Icons.bookmark_border_sharp,
                                    color: pointColor,
                                    size: 30,
                                  ),
                                ),
                              );
                            }
                            final isBookmarked = user.bookmarkRecipeIds
                                .contains(randomRecipe.recipeId);
                            return GestureDetector(
                              onTap: () async {
                                await ref
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
                },
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return CircularProgressIndicator(
                    value: downloadProgress.progress,
                  );
                },
                errorWidget: (context, url, error) =>
                    const Text('이미지가 없습니다.'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          randomRecipe.title, //포니언 스프
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
                context.go('/home/restaurant/${randomRecipe.title}');
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
                logger.d('recipeId:${randomRecipe.recipeId}');
                context.go('/home/recipe_detail/${randomRecipe.recipeId}');
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
