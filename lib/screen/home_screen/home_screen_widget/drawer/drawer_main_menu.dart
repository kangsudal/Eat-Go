import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/all_recipe_list_screen.dart';
import 'package:eat_go/screen/bookmark_screen.dart';
import 'package:eat_go/screen/history_screen.dart';
import 'package:eat_go/screen/my_recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerMainMenu extends StatelessWidget {
  const DrawerMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: EatGoPalette.mainTextColor,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    return Column(
      children: [
        ListTile(
          title: Text(
            '전체',
            style: style,
          ),
          onTap: () {
            context.go('/all_recipe_list');
          },
        ),
        ListTile(
          title: Text(
            '관심 항목',
            style: style,
          ),
          onTap: () {context.go('/bookmark');
          },
        ),
        ListTile(
          title: Text(
            '기록',
            style: style,
          ),
          onTap: () {
            context.go('/history');
          },
        ),
        ListTile(
          title: Text(
            '나의 레시피',
            style: style,
          ),
          onTap: () {
            context.go('/my_recipe');
          },
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
