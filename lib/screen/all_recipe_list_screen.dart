import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllRecipeListScreen extends StatefulWidget {
  const AllRecipeListScreen({super.key});

  @override
  State<AllRecipeListScreen> createState() => _AllRecipeListScreenState();
}

class _AllRecipeListScreenState extends State<AllRecipeListScreen> {
  final TextEditingController searchTextController = TextEditingController();
  Map<String, bool> categories = {
    '밥': true,
    '후식': true,
    '반찬': true,
    '일품': true,
    '국&찌개': true,
    '기타': true,
  };
  int totalRecipeCount = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('전체'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: pointColor, width: 1.7),
                ),
                floatingLabelStyle: const TextStyle(color: pointColor),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: EatGoPalette.lineColor, width: 1.0),
                ),
                labelText: '검색',
                labelStyle: TextStyle(
                  color: EatGoPalette.subTextColor,
                ),
                hintText: '예:두부 버섯(띄어쓰기로 구분합니다)',
                hintStyle: TextStyle(color: EatGoPalette.subTextColor),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.undo,
                    color: pointColor,
                  ),
                  onPressed: () {
                    searchTextController.text = '';
                    //검색조건 모두 초기화
                  },
                ),
              ),
              onSubmitted: (value) {
                //검색 필드와 체크박스 두가지를 체크하여 필터하기
              },
            ),
            const SizedBox(height: 5),
            Row(
              children: categories.keys.map((String key) {
                return Expanded(
                  child: Center(
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: -5,
                      children: [
                        Checkbox(
                          value: categories[key],
                          onChanged: (bool? value) {
                            setState(() {
                              categories[key] = !categories[key]!;
                              // 체크박스 토글시 리스트 필터를 적용
                            });
                          },
                        ),
                        Text(key),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              '검색 결과 $totalRecipeCount개',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: totalRecipeCount,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      //todo: 옳바른 recipeId 넣어주기
                      context.go('/home/all_recipe_list/recipe_detail/aaaaaaa');
                    },
                    title: Text('$index items[index].rcpnm!'),
                    // onTap: () => Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ManualScreen(
                    //       // recipe: items[index],
                    //     ),
                    //   ),
                    // ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: EatGoPalette.lineColor);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
