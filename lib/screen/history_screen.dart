import 'dart:math';

import 'package:eat_go/model/bookmarked_recipe.dart';
import 'package:eat_go/model/confirmed_recipe.dart';
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
      id: uuid.v4(),
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
        ),
      ),
      supportAmount: 0,
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
        maxHeight: MediaQuery.of(context).size.height,
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
            top: 50.0,
            left: 30,
            right: 30,
          ),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'data',
                  style: TextStyle(
                    color: EatGoPalette.mainTextColor,
                  ),
                ),
                subtitle: Text(
                  'subtitle',
                  style: TextStyle(
                    color: EatGoPalette.subTextColor,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: me.confirmedRecipes.length,
          ),
        ),
        body: BackgroundWidget(me: me),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.me,
  });

  final User me;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.yellow),
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
            Top3Cards(me: me),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('더보기'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Top3Cards extends StatelessWidget {
  const Top3Cards({
    super.key,
    required this.me,
  });

  final User me;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.purple,
          child: Card(me: me, order: 0),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.purple,
          child: Card(me: me, order: 1),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.purple,
          child: Card(me: me, order: 2),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.me,
    required this.order,
  });

  final User me;
  final int order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pointColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  me.confirmedRecipes[order].recipeId,
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
                      '${me.confirmedRecipes[order].confirmedCount}번 먹었어요',
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
    );
  }
}
