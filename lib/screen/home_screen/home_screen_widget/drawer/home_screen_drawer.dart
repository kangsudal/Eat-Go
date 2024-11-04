import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/drawer/drawer_filter.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/drawer/drawer_footer.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/drawer/drawer_main_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: MediaQuery.of(context).size.width * 0.64,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: EatGoPalette.backgroundColor1,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView(
            children: [
              DrawerMainMenu(),
              DrawerFilter(),
              DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
