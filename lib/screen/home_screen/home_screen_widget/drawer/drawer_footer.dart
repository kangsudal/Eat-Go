import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/about_this_app_screen.dart';
import 'package:eat_go/screen/yummy_treat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                    children: [
                      Text(
                        '광고없이 이용',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: pointColor),
                      ),
                      SizedBox(height: 10),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '광고를 먼저보고 하루종일 광고로부터 자유!',
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 150,
                        child: Image.asset(
                          'assets/icons/advertisement.png',
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '오늘 광고 제거',
                              style: TextStyle(
                                color: EatGoPalette.backgroundColor1,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '광고보기',
                              style: TextStyle(
                                color: EatGoPalette.backgroundColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '30일 광고 제거',
                              style: TextStyle(
                                color: EatGoPalette.backgroundColor1,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '3,300',
                              style: TextStyle(
                                color: EatGoPalette.backgroundColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text('닫기'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
          onTap: () {
            context.go('/yummy_treat');
          },
        ),
        ListTile(
          title: Text('ABOUT THIS APP'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AboutThisAppScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
