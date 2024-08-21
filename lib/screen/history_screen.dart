import 'dart:math';

import 'package:eat_go/model/bookmarked_recipe.dart';
import 'package:eat_go/model/confirmed_recipe.dart';
import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/model/user.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Random random = Random();
  int recipeCount = 4;
  late Uuid uuid;
  late User me;
  BorderRadius borderRadius = BorderRadius.horizontal(
    left: const Radius.circular(30),
    right: const Radius.circular(30),
  );

  @override
  void initState() {
    super.initState();
    //dummy data
    uuid = Uuid();
    me = User(
      id: uuid.v1(),
      name: 'fakeName',
      email: 'email@email.com',
      isPremium: false,
      premiumExpiration: DateTime.now(),
      // 3개의 북마크된 레시피
      bookmarks: List.generate(
        3,
        (index) => BookmarkedRecipe(
          recipeId: uuid.v4(),
          bookmarkedAt: DateTime.now().subtract(Duration(days: index * 5)),
        ),
      ),

      // 10개의 확인된 레시피
      confirmedRecipes: List.generate(
        10,
        (index) => ConfirmedRecipe(
          recipeId: uuid.v4(),
          confirmedAt: [DateTime.now().subtract(Duration(days: index))],
          confirmedCount: 1,
        ),
      ),
    );

    //dummy data end
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기록'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.4,
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        onPanelOpened: () {
          setState(() {
            borderRadius = BorderRadius.all(Radius.zero);
          });
        },
        onPanelClosed: () {
          setState(() {
            borderRadius = BorderRadius.horizontal(
              left: const Radius.circular(30),
              right: const Radius.circular(30),
            );
          });
        },
        borderRadius: borderRadius,
        panel: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 30,
            right: 30,
          ),
          child: Text('data'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '가장 자주 먹는 음식 TOP 3',
                style: TextStyle(
                  color: EatGoPalette.subTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: pointColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 66,
                            width: 66,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  me.confirmedRecipes[0].recipeId,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: pointColor,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '${me.confirmedRecipes[0].confirmedCount}번 먹었어요',
                                      style: TextStyle(
                                        color: EatGoPalette.subTextColor,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text('data'),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('더보기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
