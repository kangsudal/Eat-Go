import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/need_sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailAppBar extends ConsumerWidget implements PreferredSizeWidget{
  final Recipe recipe;

  const RecipeDetailAppBar({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);
    return AppBar(
      title: Column(
        children: [
          Tooltip(message: recipe.title, child: Text(recipe.title)),
          /*Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Tooltip(
              message: '전체 조회수입니다.',
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: pointColor,
                    size: 20,
                  ),
                  SizedBox(width:5),
                  Text(
                    '0',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Tooltip(
              message: '이 레시피를 북마크한 전체 사용자 수입니다.',
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: pointColor,
                    size: 20,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Tooltip(
              message: '이 레시피가 박수갈채 받은 수입니다.',
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/icon-clap.png',
                    color: pointColor,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width:5),
                  const Text(
                    '0',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),*/
        ],
      ),
      actions: [
        currentEatGoUser.when(
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
                  backgroundColor:
                  EatGoPalette.backgroundColor1,
                  child: Icon(
                    Icons.bookmark_border_sharp,
                    color: pointColor,
                    size: 30,
                  ),
                ),
              );
            }
            final isBookmarked =
                user.bookmarkRecipeIds.contains(recipe.recipeId);
            return IconButton(
              onPressed: () async {
                ref.read(recipeDetailViewModelProvider(recipe.recipeId).notifier).toggleBookmark(user);
              },
              icon: isBookmarked == false
                  ? const Icon(Icons.bookmark_border_sharp)
                  : const Icon(Icons.bookmark),
              color: pointColor,
            );
          },
          error: (error, stackTrace) =>
              const Icon(Icons.report_problem_outlined),
          loading: () => const SizedBox(width: 0, height: 0),
        ),
        // PopupMenuButton(
        //   iconColor: pointColor,
        //   itemBuilder: (BuildContext context) {
        //     return [
        //       const PopupMenuItem(
        //         child: Text('공유하기'),
        //       ),
        //       const PopupMenuItem(
        //         child: Text('레시피 신고하기'),
        //       ),
        //       const PopupMenuItem(
        //         child: Text('작성자 신고하기'),
        //       ),
        //     ];
        //   },
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
