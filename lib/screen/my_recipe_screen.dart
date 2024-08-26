import 'dart:math';

import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MyRecipeScreen extends StatefulWidget {
  const MyRecipeScreen({super.key});

  @override
  State<MyRecipeScreen> createState() => _MyRecipeScreenState();
}

class _MyRecipeScreenState extends State<MyRecipeScreen> {
  Random random = Random();
  late List<FakeRecipe> recipeList;
  late List<FakeRecipe> bookmarkedRecipeList;
  int recipeCount = 10;

  @override
  void initState() {
    super.initState();
    final uuid = Uuid();
    //dummy data
    recipeList = List.generate(recipeCount, (idx) {
      return FakeRecipe(
        random.nextInt(0xFFFFFFFF),
        bookmarked: true,
        id: uuid.v4(),
        createdAt: DateTime.now(),
      );
    });
    //dummy data end
    //filter recipe list by bookmarked
    bookmarkedRecipeList =
        recipeList.where((recipe) => recipe.bookmarked == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    // bookmarkedRecipeList =
    //     recipeList.where((recipe) => recipe.bookmarked == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 레시피'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
        child: ListView.builder(
          itemCount: bookmarkedRecipeList.length,
          itemBuilder: (BuildContext context, int index) {
            FakeRecipe element = bookmarkedRecipeList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: EatGoPalette.lineColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(element.value),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${element.value}'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text('${element.value}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              content: Text('관심 항목에서 삭제하시겠습니까?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('예'),
                                  onPressed: () {
                                    setState(() {
                                      element.bookmarked =
                                          !(element.bookmarked);
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: const Text('아니오'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        color: pointColor,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          // children: bookmarkedRecipeList.map((FakeRecipe element) {

          // }).toList(),
        ),
      ),
    );
  }
}
