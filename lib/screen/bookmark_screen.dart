import 'package:cached_network_image/cached_network_image.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:eat_go/viewmodels/bookmark_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('관심 항목'),
      ),
      body: const _BookmarkBody(),
    );
  }
}

/// Body 위젯 - currentEatGoUserProvider만 watch
class _BookmarkBody extends ConsumerWidget {
  const _BookmarkBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);

    return currentEatGoUser.when(
      data: (user) {
        if (user == null) {
          return const Center(
            child: Text('유저 정보를 불러오지 못했습니다.'),
          );
        }
        return _BookmarkList(user: user);
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text('오류가 발생했습니다.'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

/// 북마크 리스트 위젯 - bookmarkViewModelProvider만 watch
class _BookmarkList extends ConsumerWidget {
  const _BookmarkList({required this.user});

  final EatGoUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkViewState = ref.watch(bookmarkViewModelProvider(user));
    final bookmarkViewModel =
        ref.read(bookmarkViewModelProvider(user).notifier);

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: bookmarkViewState.when(
        data: (bookmarkedRecipeList) {
          if (bookmarkedRecipeList == null) {
            return const Center(
              child: Text('리스트를 불러오는데 실패하였습니다.'),
            );
          }
          if (bookmarkedRecipeList.isEmpty) {
            return const _EmptyBookmarkWidget();
          }
          return ListView.builder(
            itemCount: bookmarkedRecipeList.length,
            itemBuilder: (BuildContext context, int index) {
              final Recipe recipe = bookmarkedRecipeList[index];
              return _BookmarkListItem(
                recipe: recipe,
                bookmarkViewModel: bookmarkViewModel,
              );
            },
          );
        },
        error: (error, stackTrace) {
          logger.e('BookmarkScreen', error: error);
          return const Center(child: Text('리스트를 불러오는데 실패하였습니다.'));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

/// 빈 북마크 위젯
class _EmptyBookmarkWidget extends StatelessWidget {
  const _EmptyBookmarkWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
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
          const Text('아직 북마크한 레시피가 없습니다.'),
        ],
      ),
    );
  }
}

/// 북마크 리스트 아이템 위젯
class _BookmarkListItem extends StatelessWidget {
  const _BookmarkListItem({
    required this.recipe,
    required this.bookmarkViewModel,
  });

  final Recipe recipe;
  final BookmarkViewModel bookmarkViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: () {
          context.go(
            '/home/bookmark/recipe_detail/${recipe.recipeId}',
          );
        },
        child: CustomListTile(
          leading: SizedBox(
            width: 70,
            height: 70,
            child: CachedNetworkImage(
              imageUrl: recipe.completedImgUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
              errorWidget: (context, _, __) {
                return const Center(
                  child: Icon(Icons.report_problem_outlined),
                );
              },
            ),
          ),
          mid: Text(recipe.title),
          trailing: IconButton(
            onPressed: () {
              _showDeleteDialog(context);
            },
            icon: const Icon(
              Icons.delete,
              color: pointColor,
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: const Text('관심 항목에서 삭제하시겠습니까?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('예'),
              onPressed: () async {
                await bookmarkViewModel.toggleBookmark(recipe: recipe);
                if (context.mounted) {
                  context.pop();
                }
              },
            ),
            CupertinoDialogAction(
              child: const Text('아니오'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
