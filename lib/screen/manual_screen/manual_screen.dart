import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/manual_screen/comment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: pointColor,
        onPressed: () {
          print('OK');
        },
        tooltip: "오늘은 이 메뉴로 확정",
        child: Text(
          '식당',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        // shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    onPressed: () {},
                    color: pointColor,
                    child: Text(
                      '오늘은 이 메뉴로 확정',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Tooltip(
                    message: '전체 사용자가 확정한 수입니다.',
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: pointColor,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '32',
                          style: TextStyle(
                            color: pointColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CommentButton(),
            ],
          ),
        ),
      ),
    );
  }
}
