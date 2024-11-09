import 'package:flutter/material.dart';

enum MenuCategory {
  rice, // 밥
  dessert, // 후식
  sideDish, // 반찬
  mainDish, // 일품
  soupStew, // 국&찌개
  others // 기타
}

//레시피 종류를 입력하는 라디오 버튼들
class RecipeCategoryPanel extends StatefulWidget {
  const RecipeCategoryPanel({super.key});

  @override
  State<RecipeCategoryPanel> createState() => _RecipeCategoryPanelState();
}

class _RecipeCategoryPanelState extends State<RecipeCategoryPanel> {
  MenuCategory selectedValueGroup1 = MenuCategory.rice; // 선택된 값을 저장할 변수
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '종류',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.rice,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('밥'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.dessert,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('후식'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.sideDish,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('반찬'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.mainDish,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                        print(selectedValueGroup1);
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('일품'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.soupStew,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                        print(selectedValueGroup1);
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('국&찌개'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.others,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('기타'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
