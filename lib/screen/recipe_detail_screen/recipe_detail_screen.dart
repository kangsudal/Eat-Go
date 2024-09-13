import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/recipe_detail_screen/comment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
          child: Placeholder(
        fallbackHeight: 1000,
      )),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.amber,
                  child: Row(
                    children: [
                      Icon(
                        Icons.maps_home_work_sharp,
                        color: pointColor,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '식당',
                        style: TextStyle(color: pointColor),
                      ),
                    ],
                  ),
                ),
                CommentButton(),
              ],
            ),
            Tooltip(
              message: '먹은 날짜와 횟수가 기록 됩니다.',
              child: SizedBox(
                height: 30,
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  onPressed: () {},
                  color: pointColor,
                  child: Row(
                    children: [
                      Text(
                        '선택',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Wrap(
        children: [
          Tooltip(
              message: '카레 크림 파스타aaaaaaaa', child: Text('카레 크림 파스타aaaaaaaa')),
          Tooltip(
            message: '전체 사용자가 확정한 수입니다.',
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: pointColor,
                  size: 20,
                ),
                SizedBox(width: 3),
                Text(
                  '32',
                  style: TextStyle(
                    color: pointColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark,
            color: pointColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            color: pointColor,
          ),
        ),
        PopupMenuButton(
          iconColor: pointColor,
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('신고하기'),
              ),
              PopupMenuItem(
                child: Text('차단하기'),
              ),
            ];
          },
        ),
      ],
    );
  }
}
