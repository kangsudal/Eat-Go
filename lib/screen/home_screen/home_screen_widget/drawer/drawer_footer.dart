import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Use without No Ads'),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Column(
                    children: [],
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: CupertinoButton(
                        color: pointColor,
                        child: Text(
                          '오늘 광고 제거',
                          style: TextStyle(
                            color: EatGoPalette.backgroundColor1,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: CupertinoButton(
                        color: pointColor,
                        child: Text(
                          '30일 광고 제거',
                          style: TextStyle(
                            color: EatGoPalette.backgroundColor1,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        ListTile(
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BUY ME A YUMMY TREAT!',
              ),
              const Icon(
                Icons.coffee,
                color: Colors.black,
              ),
            ],
          ),
        ),
        ListTile(
          title: Text('ABOUT THIS APP'),
        ),
      ],
    );
  }
}
