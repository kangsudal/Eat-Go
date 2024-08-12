import 'dart:math';

import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Random random = Random();
  Color? randomColor;
  bool? bookmarked;
  bool pinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: IconButton(
          onPressed: () {
            setState(() {
              pinned = !pinned;
              print(pinned);
            });
          },
          icon: pinned
              ? Image.asset(
                  'assets/icons/pinned_true.png',
                  color: pointColor,
                  width: 25,
                  height: 25,
                  fit: BoxFit.scaleDown,
                )
              : SvgPicture.asset(
                  'assets/icons/pinned_false.svg',
                  colorFilter:
                      const ColorFilter.mode(pointColor, BlendMode.srcIn),
                ),
        ),
        actions: [
          IconButton(
            iconSize: 40,
            color: pointColor,
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        // width: MediaQuery.of(context).size.width * 0.64,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
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
      ),
      floatingActionButton: Visibility(
        visible: !pinned,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              randomColor = Color(random.nextInt(0xFFFFFFFF));
            });
          },
          child: Icon(
            Icons.refresh,
            color: EatGoPalette.backgroundColor1,
            size: 45,
          ),
        ),
      ),
      body: Align(
        alignment: const Alignment(0, -0.25),
        child: randomColor == null
            ? Container(
                // color: Colors.yellow,
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        Text(
                          'SHAKE!',
                          style: GoogleFonts.poppins(
                            //HomeScreen에서 'SHAKE' 글씨
                            fontSize: 70,
                            fontWeight: FontWeight.w700,
                            color: pointColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(
                // color: Colors.yellow,
                height: randomColor!.value * 0.00000008 + 170,
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: randomColor!.value * 0.00000008,
                          height: randomColor!.value * 0.00000008,
                          decoration: BoxDecoration(
                            color: randomColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(35),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (bookmarked == null) {
                                  bookmarked = true;
                                } else {
                                  bookmarked = !bookmarked!;
                                }
                                debugPrint('$bookmarked');
                              });
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: EatGoPalette.backgroundColor1,
                              child: Icon(
                                bookmarked == null || bookmarked == false
                                    ? Icons.bookmark_border_sharp
                                    : Icons.bookmark,
                                color: pointColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      '${randomColor!.value}', //포니언 스프
                      style: TextStyle(
                        fontSize: 40,
                        color: pointColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: pointColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'RESTAURANT',
                              style: TextStyle(
                                color: EatGoPalette.backgroundColor1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.7,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 110,
                          height: 40,
                          decoration: BoxDecoration(
                            color: EatGoPalette.backgroundColor1,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: pointColor,
                              width: 2.5,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'RECIPE',
                              style: TextStyle(
                                color: pointColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.7,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

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
        ),
        ListTile(
          title: Text(
            '관심 항목',
            style: style,
          ),
        ),
        ListTile(
          title: Text(
            '기록',
            style: style,
          ),
        ),
        ListTile(
          title: Text(
            '나의 레시피',
            style: style,
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}

class DrawerFilter extends StatefulWidget {
  const DrawerFilter({super.key});

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}

class _DrawerFilterState extends State<DrawerFilter> {
  Map<String, bool> categories = {
    '밥': false,
    '후식': true,
    '반찬': true,
    '일품': true,
    '국&찌개': true,
    '기타': true,
  };

  @override
  Widget build(BuildContext context) {
    int count = -999;

    TextStyle style = TextStyle(
      color: EatGoPalette.mainTextColor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 30, bottom: 6),
          child: Text(
            '필터',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ),
        Padding(
          //ListTile처럼 왼쪽부분에 padding 넣어줌
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "예: '두부 버섯' 띄어쓰기로 구분합니다",
                      hintStyle: TextStyle(
                        fontSize: 11,
                        color: pointColor,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '$count개',
                    style: TextStyle(
                      // fontSize: 13,
                      color: EatGoPalette.mainTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...categories.entries.map(
          (element) {
            return Padding(
              padding: EdgeInsets.only(left: 17, bottom: 4),
              child: Row(
                children: [
                  Expanded(child: Text(element.key, style: style)),
                  CupertinoSwitch(
                    value: element.value,
                    onChanged: (isTrue) {
                      setState(() {
                        categories[element.key] = isTrue;
                        // debugPrint('${element.key}: ${categories[element.key]}');
                      });
                    },
                    activeColor: pointColor,
                    trackColor: Colors.black,
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        const Divider(thickness: 1),
      ],
    );
  }
}

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            // color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.coffee,
                  size: 40,
                ),
                const SizedBox(width: 5),
                Text(
                  'BUY ME A YUMMY TREAT!',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              padding: EdgeInsets.all(10),
              // color: Colors.yellow,
              child: Text('ABOUT THIS APP')),
        ],
      ),
    );
  }
}
