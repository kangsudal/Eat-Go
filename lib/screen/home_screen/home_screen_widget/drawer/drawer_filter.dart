import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
            '집에 있는 재료로 검색하여 필터',
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
