import 'package:cached_network_image/cached_network_image.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyRecipeListScreen extends ConsumerWidget {
  const MyRecipeListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myRecipeListState = ref.watch(myRecipeListViewModelProvider);
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 레시피'),
      ),
      body: currentEatGoUser.when(
        data: (currentEatGoUser) {
          if (currentEatGoUser == null) {
            return const Center(
              child: Text('현재 사용자를 불러오지 못하였습니다.'),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: myRecipeListState.when(
              data: (recipeList) {
                if (recipeList.isEmpty) {
                  return Align(
                    alignment: const Alignment(0, -0.3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/pencil-img.png',
                          width: 150,
                          height: 150,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: currentEatGoUser.displayName,
                            style: const TextStyle(
                              fontSize: 18,
                              color: pointColor,
                              fontWeight: FontWeight.bold,
                            ),
                            children: const [
                              TextSpan(
                                text: '님만의 \n특별한 레시피를 작성해주세요!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: recipeList.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: currentEatGoUser.displayName,
                              style: const TextStyle(
                                fontSize: 15,
                                color: pointColor,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '님께서 올려주신 소중한 레시피',
                                  style: TextStyle(
                                    color: EatGoPalette.subTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SortBar(),
                          // IncreaseGraphBox(),
                          const SizedBox(height: 30),
                        ],
                      );
                    } else {
                      final Recipe element = recipeList[index - 1];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            context.go(
                              '/home/my_recipe_list/recipe_detail/${element.recipeId}',
                            );
                          },
                          child: CustomListTile(
                            leading: SizedBox(
                              width: 70,
                              height: 70,
                              child: CachedNetworkImage(
                                imageUrl: element.completedImgUrl,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, _, __) => const Center(
                                  child: Icon(Icons.report_problem_outlined),
                                ),
                              ),
                            ),
                            mid: SizedBox(
                              height: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(element.title),
                                    ),
                                  ),
                                  /*
                            각 셀 아래에 있는 조회수 등의 메타정보
                            Container(
                              // color: Colors.pink,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: pointColor,
                                        size: 17,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '-99',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: pointColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 7),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bookmark,
                                        color: pointColor,
                                        size: 17,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '-99',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: pointColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 7),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/icon-clap.png',
                                        color: pointColor,
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(width: 1),
                                      Text(
                                        '-99',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: pointColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),*/
                                ],
                              ),
                            ),
                            trailing: PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              iconColor: pointColor,
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    child: const Text('수정'),
                                    onTap: () {
                                      //todo: GoRouter로
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RecipeWriteScreen(
                                            isEditMode: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: const Text('삭제'),
                                    onTap: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            content: const Text(
                                              '나의 레시피에서 삭제하시겠습니까?',
                                            ),
                                            actions: [
                                              CupertinoDialogAction(
                                                child: const Text('예'),
                                                onPressed: () {
                                                  Navigator.pop(context);
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
                                    },
                                  ),
                                ];
                              },
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
              error: (error, stackTrace) {
                logger.e('MyRecipeListScreen-262', error: error);
                return const Center(
                  child: Text('오류가 발생하였습니다.'),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
        error: (error, stackTrace) {
          logger.e('MyRecipeListScreen-272', error: error);
          return const Center(
            child: Text('오류가 발생하였습니다.'),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: goRouter로 바꾸기
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RecipeWriteScreen(),
            ),
          );
        },
        child: Icon(
          Icons.edit_outlined,
          color: EatGoPalette.backgroundColor1,
          size: 38,
        ),
      ),
    );
  }
}

class IncreaseGraphBox extends StatelessWidget {
  const IncreaseGraphBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('전체기간 레시피 조회수'),
                Text(
                  '${-99}',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFFDCEADF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '+ 신규 조회수 -99회',
                style: TextStyle(
                  color: Color(0xFF1B7338),
                ),
              ),
            ),
          ],
        ),
        Placeholder(
          fallbackWidth: MediaQuery.of(context).size.width,
          fallbackHeight: 150,
        ),
      ],
    );
  }
}

class SortBar extends StatelessWidget {
  const SortBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.remove_red_eye,
          color: pointColor,
        ),
        const Text(
          ' ${-99}   ',
          style: TextStyle(
            color: pointColor,
          ),
        ),
        const Icon(
          Icons.bookmark,
          color: pointColor,
        ),
        const Text(
          ' ${-99}   ',
          style: TextStyle(
            color: pointColor,
          ),
        ),
        Image.asset(
          'assets/icons/icon-clap.png',
          color: pointColor,
          width: 20,
          height: 20,
        ),
        const Text(
          ' ${-99}',
          style: TextStyle(
            color: pointColor,
          ),
        ),
        const Spacer(),
        PopupMenuButton(
          icon: const Icon(
            Icons.sort,
            color: pointColor,
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    SizedBox(width: 10),
                    Expanded(child: Text('날짜순 정렬')),
                  ],
                ),
              ),
              const PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.remove_red_eye),
                    SizedBox(width: 10),
                    Text('조회수 순서로 정렬'),
                  ],
                ),
              ),
              const PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.bookmark),
                    SizedBox(width: 10),
                    Text('북마크수 순서로 정렬'),
                  ],
                ),
              ),
              const PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline),
                    SizedBox(width: 10),
                    Text('전체 채택된 수 순서로 정렬'),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
