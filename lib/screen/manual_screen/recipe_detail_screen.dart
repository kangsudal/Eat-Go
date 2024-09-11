import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/manual_screen/comment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30, top: 20),
          child: Column(
            children: [
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
      ),
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
            CupertinoButton(
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
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Wrap(
        children: [
          Text('카레 크림 파스타aaaaaaaa'),
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
      ],
    );
  }
}
