import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerFilter extends ConsumerStatefulWidget {
  const DrawerFilter({super.key});

  @override
  ConsumerState<DrawerFilter> createState() => _DrawerFilterState();
}

class _DrawerFilterState extends ConsumerState<DrawerFilter> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final keywords = ref.watch(keywordsProvider);
    textEditingController.text = keywords;
    // int count = -999;

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
                    controller: textEditingController,
                    //텍스트필드의 상태를 유지할 수 있게함. 매번 새로 렌더링될 때 controller의 현재 값을 표시
                    decoration: InputDecoration(
                      hintText: "예: '두부 버섯' 띄어쓰기로 구분합니다",
                      hintStyle: TextStyle(
                        fontSize: 11,
                        color: pointColor,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      // TextField의 값이 변경될 때마다 keywordProvider 업데이트
                      ref.read(keywordsProvider.notifier).state = text;
                    },
                  ),
                ),
              ),
              /*SizedBox(
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
              ),*/
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
                      ref.read(categoriesProvider.notifier).update((state) {
                        return {...state, element.key: isTrue};
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
