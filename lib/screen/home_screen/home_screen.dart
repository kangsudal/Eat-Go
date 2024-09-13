import 'dart:math';

import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/home_screen/home_screen_widget/drawer/home_screen_drawer.dart';
import 'package:eat_go/screen/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool isShakingLocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: IconButton(
          onPressed: () {
            setState(() {
              isShakingLocked = !isShakingLocked;
              print(isShakingLocked);
            });
          },
          icon: isShakingLocked
              ? const Icon(Icons.lock, color: pointColor)
              : const Icon(Icons.lock_open, color: pointColor),
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
      endDrawer: const HomeScreenDrawer(),
      floatingActionButton: Visibility(
        visible: !isShakingLocked,
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
                              '식당',
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RecipeDetailScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
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
                                '레시피',
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
