import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
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
  final ExpansibleController expansionTileController = ExpansibleController();

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(allRecipeListScreenCategoriesProvider);
    final keywords = ref.watch(allRecipeListScreenKeywordsProvider);
    final AsyncValue<List<Recipe>> recipeState = ref.watch(
      allRecipeListViewModelProvider,
    ); // ViewModel의 상태를 구독, 레시피 데이터를 가져오는데 로딩중, 성공, 실패 나타냄
    final allRecipeListViewModel =
        ref.read(allRecipeListViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('전체'),
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
                // labelText: '검색',
                labelStyle: TextStyle(
                  color: EatGoPalette.subTextColor,
                ),
                hintText: '예:두부 버섯(띄어쓰기로 구분합니다)',
                hintStyle: TextStyle(color: EatGoPalette.subTextColor),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: keywords.isNotEmpty ||
                          categories.containsValue(false),
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: pointColor,
                        ),
                        onPressed: () {
                          searchTextController.text = '';
                          //검색조건 모두 초기화
                          //검색창
                          ref
                              .read(
                                allRecipeListScreenKeywordsProvider.notifier,
                              )
                              .state = '';
                          //카테고리 체크박스
                          ref
                              .read(
                                allRecipeListScreenCategoriesProvider.notifier,
                              )
                              .state = {
                            '밥': true,
                            '후식': true,
                            '반찬': true,
                            '일품': true,
                            '국&찌개': true,
                            '기타': true,
                          };
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        allRecipeListViewModel.fetchFilteredRecipes(
                          categories: categories,
                          keywords: keywords,
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: pointColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: const Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              onSubmitted: (value) {
                //검색 필드와 체크박스 두가지를 체크하여 필터하기
              },
              onChanged: (text) {
                // TextField의 값이 변경될 때마다 keywordProvider 업데이트
                ref.read(allRecipeListScreenKeywordsProvider.notifier).state =
                    text;
              },
            ),
            const SizedBox(height: 5),
            Row(
              children: categories.entries.map((element) {
                return Expanded(
                  child: Center(
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: -5,
                      children: [
                        Checkbox(
                          value: element.value,
                          onChanged: (bool? isTrue) {
                            ref
                                .read(
                              allRecipeListScreenCategoriesProvider.notifier,
                            )
                                .update((state) {
                              return {
                                ...state,
                                element.key: isTrue ?? false,
                              };
                            });
                          },
                        ),
                        Text(element.key),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: recipeState.when(
                // 로딩 상태 처리
                loading: () => const Center(child: CircularProgressIndicator()),

                // 에러 상태 처리
                error: (error, stackTrace) =>
                    Center(child: Text('오류 발생: $error')),

                // 데이터 상태 처리
                data: (recipes) {
                  if (recipes.isEmpty) {
                    return Align(
                      alignment: const Alignment(0, -0.3),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/memo-no-result.png',
                            width: 200,
                            height: 200,
                          ),
                          const SizedBox(height: 10),
                          const Text('조건에 맞는 레시피가 없습니다.'),
                        ],
                      ),
                    );
                  }

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
                                context.go(
                                  '/home/all_recipe_list/recipe_detail/${recipes[index].recipeId}',
                                );
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
