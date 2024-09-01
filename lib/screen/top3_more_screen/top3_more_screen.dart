import 'package:eat_go/screen/top3_more_screen/top3_more_screen_widget/top3_card.dart';
import 'package:flutter/material.dart';

class Top3MoreScreen extends StatelessWidget {
  Top3MoreScreen({super.key});

  int top3Count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('가장 자주 먹는 음식 리스트'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30,
          top: 10,
          bottom: 30,
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 5),
              // color: Colors.purple,
              child: Top3Card(),
            );
          },
          itemCount: top3Count,
        ),
      ),
    );
  }
}
