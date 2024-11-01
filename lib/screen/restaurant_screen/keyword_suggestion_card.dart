import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class KeywordSuggestionCard extends StatelessWidget {
  const KeywordSuggestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin:
            EdgeInsets.only(left: 60, top: MediaQuery.of(context).padding.top),
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
