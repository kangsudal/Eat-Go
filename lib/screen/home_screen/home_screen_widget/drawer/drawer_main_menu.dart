import 'package:eat_go/palette.dart';
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
            context.go('/home/all_recipe_list');
          },
        ),
        ListTile(
          title: Text(
            '관심 항목',
            style: style,
          ),
          onTap: () {
            context.go('/home/bookmark');
          },
        ),
        // ListTile(
        //   title: Text(
        //     '나의 레시피',
        //     style: style,
        //   ),
        //   onTap: () {
        //     context.go('/home/my_recipe_list');
        //   },
        // ),
        const Divider(thickness: 1),
      ],
    );
  }
}
