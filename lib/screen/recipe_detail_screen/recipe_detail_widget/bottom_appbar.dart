import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

BottomAppBar buildBottomAppBar(BuildContext context, String recipeId) {
  return BottomAppBar(
    height: 60,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.go('/home/restaurant/$recipeId');
            },
            child: Container(
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
                      '채택',
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
