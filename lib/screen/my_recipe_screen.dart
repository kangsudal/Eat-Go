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
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: ListView.builder(
          itemCount: bookmarkedRecipeList.length,
          itemBuilder: (BuildContext context, int index) {
            FakeRecipe element = bookmarkedRecipeList[index];
            return CustomListTile(element: element);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.edit_outlined,
          color: EatGoPalette.backgroundColor1,
          size: 38,
        ),
      ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  //일반 ListTile은 leading의 height 제약이 있어서, 만듬
  final FakeRecipe element;

  const CustomListTile({super.key, required this.element});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20.0),
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
              color: Color(widget.element.value),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 70,
              // color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${widget.element.value}')),
                  ),
                  Container(
                    // color: Colors.pink,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: pointColor,
                              size: 17,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '-99',
                              style: TextStyle(
                                fontSize: 12,
                                color: pointColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 7),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: pointColor,
                              size: 17,
                            ),
                            SizedBox(width: 1),
                            Text(
                              '-99',
                              style: TextStyle(
                                fontSize: 12,
                                color: pointColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.all(5),
            constraints: const BoxConstraints(),
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
                            widget.element.bookmarked =
                                !(widget.element.bookmarked);
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
              Icons.more_vert,
              color: pointColor,
            ),
          )
        ],
      ),
    );
  }
}
