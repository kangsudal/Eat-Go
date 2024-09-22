import 'dart:math';

import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:eat_go/screen/write_screen/write_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MyRecipeScreen extends StatefulWidget {
  const MyRecipeScreen({super.key});

  @override
  State<MyRecipeScreen> createState() => _MyRecipeScreenState();
}

class _MyRecipeScreenState extends State<MyRecipeScreen> {
  Random random = Random();
  late List<FakeRecipe> recipeList;
  int recipeCount = 10;

  @override
  void initState() {
    super.initState();
    final uuid = Uuid();
    //dummy data
    recipeList = List.generate(recipeCount, (idx) {
      return FakeRecipe(
        random.nextInt(0xFFFFFFFF),
        bookmarked: true,
        id: uuid.v4(),
        createdAt: DateTime.now(),
      );
    });
    //dummy data end
  }

  @override
  Widget build(BuildContext context) {
    // bookmarkedRecipeList =
    //     recipeList.where((recipe) => recipe.bookmarked == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 레시피'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: ListView.builder(
          itemCount: recipeList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'kangsudal님께서 올려주신 소중한 레시피',
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
              FakeRecipe element = recipeList[index - 1];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomListTile(
                  leading: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(element.value),
                    ),
                  ),
                  mid: Container(
                    height: 70,
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('${element.value}')),
                        ),
                        Container(
                          // color: Colors.pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                  content: Text('나의 레시피에서 삭제하시겠습니까?'),
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
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WriteScreen(),
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
