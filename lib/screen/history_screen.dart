import 'dart:math';

import 'package:eat_go/model/bookmarked_recipe.dart';
import 'package:eat_go/model/confirmed_recipe.dart';
import 'package:eat_go/model/user.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/top3_more_screen/top3_more_screen_widget/top3_card.dart';
import 'package:eat_go/screen/top3_more_screen/top3_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late int confirmedRecipeCount;
  BorderRadius borderRadius = BorderRadius.vertical(
    top: const Radius.circular(30),
  );
  bool _isPanelOpen = false;
  PanelController _slidingController = PanelController();

  @override
  void initState() {
    super.initState();
    //dummy data
    confirmedRecipeCount = 20;
    //dummy data end
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기록'),
        leading: _isPanelOpen == true
            ? IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 35,
                ),
                onPressed: () {
                  _slidingController.close();
                },
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
      ),
      body: SlidingUpPanel(
        controller: _slidingController,
        minHeight: MediaQuery.of(context).size.height * 0.38,
        maxHeight: MediaQuery.of(context).size.height,
        onPanelOpened: () {
          setState(() {
            borderRadius = BorderRadius.all(Radius.zero);
          });
        },
        onPanelClosed: () {
          setState(() {
            borderRadius = BorderRadius.vertical(
              top: const Radius.circular(30),
            );
          });
        },
        borderRadius: borderRadius,
        onPanelSlide: (position) {
          setState(() {
            _isPanelOpen = position > 0.3;
          });
        },
        panel: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 30,
            right: 30,
            bottom: 130,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TIMESTAMP',
                style: TextStyle(
                  color: EatGoPalette.subTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 13),
              Expanded(
                child: ListView.separated(
                  physics: _isPanelOpen
                      ? AlwaysScrollableScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '레시피명$index',
                          style: TextStyle(
                            color: EatGoPalette.mainTextColor,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        'subtitle',
                        style: TextStyle(
                          color: EatGoPalette.subTextColor,
                        ),
                      ),
                      trailing: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              size: 30,
                              Icons.delete,
                              color: pointColor,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    insetPadding: EdgeInsets.zero,
                                    title: Text(
                                      '이 기록을 삭제하시겠습니까?',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('예'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('아니오'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: confirmedRecipeCount,
                ),
              ),
            ],
          ),
        ),
        body: BackgroundWidget(),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
      child: Container(
        // decoration: BoxDecoration(color: Colors.yellow),
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
            SizedBox(height: 13),
            Top3Cards(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Top3MoreScreen(),
                    ),
                  );
                },
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          // color: Colors.purple,
          child: Top3Card(),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          // color: Colors.purple,
          child: Top3Card(),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          // color: Colors.purple,
          child: Top3Card(),
        ),
      ],
    );
  }
}
