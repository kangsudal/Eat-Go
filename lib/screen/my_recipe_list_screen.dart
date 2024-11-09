import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class MyRecipeListScreen extends ConsumerStatefulWidget {
  const MyRecipeListScreen({super.key});

  @override
  ConsumerState<MyRecipeListScreen> createState() => _MyRecipeScreenState();
}

class _MyRecipeScreenState extends ConsumerState<MyRecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    final myRecipeListViewModel =
        ref.watch(myRecipeListViewModelProvider.notifier);
    final myRecipeListState = ref.watch(myRecipeListViewModelProvider);
    final currentEatGoUser = ref.watch(currentEatGoUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 레시피'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: myRecipeListState.when(
            data: (recipeList) {
              return currentEatGoUser.when(
                  data: (currentEatGoUser) {
                    if (currentEatGoUser == null) {
                      return const Center(
                        child: Text('현재 사용자를 불러오지 못하였습니다.'),
                      );
                    }
                    if (recipeList.isEmpty) {
                      return Align(
                        alignment: const Alignment(0, -0.3),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/pencil-img.png',
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
                                    fontWeight: FontWeight.bold),
                                children: const [
                                  TextSpan(
                                    text: '님만의 \n특별한 레시피를 작성해주세요!',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
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
                              Text(
                                '${currentEatGoUser.displayName}님께서 올려주신 소중한 레시피',
                                style: TextStyle(
                                  color: EatGoPalette.subTextColor,
                                ),
                              ),
                              SortBar(),
                              IncreaseGraphBox(),
                              SizedBox(height: 30),
                            ],
                          );
                        } else {
                          Recipe element = recipeList[index - 1];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                //todo: 옳바른 recipeId 넣어주기
                                context.go(
                                    '/home/my_recipe/recipe_detail/${element.recipeId}');
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
                                    errorWidget: (context, _, __) =>
                                        const Center(
                                            child: Icon(
                                                Icons.report_problem_outlined)),
                                  ),
                                ),
                                mid: SizedBox(
                                  height: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(element.title)),
                                      ),
                                      Container(
                                        // color: Colors.pink,
                                        child: const Row(
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
                                                Icon(
                                                  Icons.check_circle_outline,
                                                  color: pointColor,
                                                  size: 17,
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
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: PopupMenuButton(
                                  icon: Icon(Icons.more_vert),
                                  iconColor: pointColor,
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        child: Text('수정'),
                                      ),
                                      PopupMenuItem(
                                        child: Text('삭제'),
                                        onTap: () {
                                          showCupertinoDialog(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoAlertDialog(
                                                content:
                                                    Text('나의 레시피에서 삭제하시겠습니까?'),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: const Text('예'),
                                                    onPressed: () {
                                                      setState(() {});
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
                    return const Center(
                      child: Text('오류가 발생하였습니다.'),
                    );
                  },
                  loading: () => const CircularProgressIndicator());
            },
            error: (error, stackTrace) {
              return Center(child: Text(error.toString()));
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: goRouter로 바꾸기
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RecipeWriteScreen(),
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
            Column(
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
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFDCEADF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
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
        Icon(
          Icons.remove_red_eye,
          color: pointColor,
        ),
        Text(
          ' ${-99}   ',
          style: TextStyle(
            color: pointColor,
          ),
        ),
        Icon(
          Icons.bookmark,
          color: pointColor,
        ),
        Text(
          ' ${-99}   ',
          style: TextStyle(
            color: pointColor,
          ),
        ),
        Icon(
          Icons.check_circle_outline,
          color: pointColor,
        ),
        Text(
          ' ${-99}',
          style: TextStyle(
            color: pointColor,
          ),
        ),
        Spacer(),
        PopupMenuButton(
          icon: Icon(
            Icons.sort,
            color: pointColor,
          ),
          itemBuilder: (BuildContext) {
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    SizedBox(width: 10),
                    Expanded(child: Text('날짜순 정렬')),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.remove_red_eye),
                    SizedBox(width: 10),
                    Text('조회수 순서로 정렬'),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.bookmark),
                    SizedBox(width: 10),
                    Text('북마크수 순서로 정렬'),
                  ],
                ),
              ),
              PopupMenuItem(
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
