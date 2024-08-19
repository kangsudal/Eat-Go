import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.purple,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '가장 자주 먹는 음식 TOP 3',
                    style: TextStyle(
                      color: EatGoPalette.subTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }
}
