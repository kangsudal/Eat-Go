import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 10;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        children: [
          KeywordSuggestionCard(),
          BackButton(),
          ScrollableCards(itemCount: itemCount),
        ],
      ),
    );
  }
}

class ScrollableCards extends StatelessWidget {
  const ScrollableCards({
    super.key,
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.gps_fixed,
                color: pointColor,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 120, //card사이즈의 height값이 여기에 맞춰진다.
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext, index) => GestureDetector(
                onTap: () {},
                child: Container(
                  margin: index == itemCount - 1
                      ? EdgeInsets.only(left: 20, right: 20, bottom: 30)
                      : EdgeInsets.only(left: 20, bottom: 30),
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20.0,
                        spreadRadius: -10.0,
                        offset: const Offset(8, 10),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: itemCount,
            ),
          ),
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: FloatingActionButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment(0.4, 0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: pointColor,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class KeywordSuggestionCard extends StatelessWidget {
  const KeywordSuggestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 23, left: 60),
        padding: const EdgeInsets.all(8),
        height: 55,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20.0,
              spreadRadius: -10.0,
              offset: const Offset(8, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '카레 파스타',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '로 검색한 결과입니다.',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '카레 두부면 파스타',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: pointColor,
                        ),
                      ),
                      TextSpan(
                        text: ' 검색결과 보기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
