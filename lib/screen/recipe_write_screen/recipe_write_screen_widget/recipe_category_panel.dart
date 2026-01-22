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
    return RadioGroup<MenuCategory>(
      groupValue: selectedValueGroup1,
      onChanged: (value) {
        setState(() {
          selectedValueGroup1 = value!;
        });
      },
      child: const Column(
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
                    Radio<MenuCategory>(
                      value: MenuCategory.rice,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('밥'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio<MenuCategory>(
                      value: MenuCategory.dessert,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('후식'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio<MenuCategory>(
                      value: MenuCategory.sideDish,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('반찬'),
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
                    Radio<MenuCategory>(
                      value: MenuCategory.mainDish,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('일품'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio<MenuCategory>(
                      value: MenuCategory.soupStew,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('국&찌개'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio<MenuCategory>(
                      value: MenuCategory.others,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('기타'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
