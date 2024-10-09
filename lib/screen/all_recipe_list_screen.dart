import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/services/recipe_service.dart';
import 'package:eat_go/viewmodels/recipe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AllRecipeListScreen extends ConsumerStatefulWidget {
  const AllRecipeListScreen({super.key});

  @override
  ConsumerState<AllRecipeListScreen> createState() =>
      _AllRecipeListScreenState();
}

class _AllRecipeListScreenState extends ConsumerState<AllRecipeListScreen> {
  final TextEditingController searchTextController = TextEditingController();
  Map<String, bool> categories = {
    '밥': true,
    '후식': true,
    '반찬': true,
    '일품': true,
    '국&찌개': true,
    '기타': true,
  };

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = ref.read(recipeViewModelProvider.notifier);
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
            Expanded(
              child: StreamBuilder<List<Recipe>>(
                stream: recipeViewModel.recipesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('오류 발생: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('레시피가 없습니다.'));
                  }

                  final recipes = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '검색 결과 ${recipes.length}개',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: recipes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: () {
                                //todo: 옳바른 recipeId 넣어주기
                                context.go(
                                    '/home/all_recipe_list/recipe_detail/aaaaaaa');
                              },
                              title: Text(recipes[index].title),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(color: EatGoPalette.lineColor);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
