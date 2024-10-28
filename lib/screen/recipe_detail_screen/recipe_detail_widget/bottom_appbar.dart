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
          /*Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/icon-clap.png',
                ),
              ),
              Text('0'),
            ],
          ),*/
        ],
      ),
    ),
  );
}
