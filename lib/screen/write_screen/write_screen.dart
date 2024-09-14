import 'dart:io';

import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/build_recipe_explain_and_img_sets.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/completed_recipe.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/ingredients_text_field.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/recipe_category_panel.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/recipe_explain_input.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/recipe_name_text_field.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/camera_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final ScrollController _scrollController = ScrollController();
  List<RecipeExplainInput> recipeExplainInputs = [
    RecipeExplainInput(
      textEditingController: TextEditingController(),
      globalKeyForScroll: GlobalKey(), //스크롤을 위해 설명 widget들에게 할당해줌
    ),
  ];

  @override
  void dispose() {
    // 모든 컨트롤러를 해제
    for (var input in recipeExplainInputs) {
      input.textEditingController.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: EatGoPalette.lineColor,
            width: 1,
          ),
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
            style: TextStyle(
              color: EatGoPalette.subTextColor,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              //writeData.upload();
            },
            child: Text('Post'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //레시피 이름을 입력하는 텍스트 필드
              RecipeNameTextField(),
              SizedBox(height: 30),
              //레시피 종류를 입력하는 라디오 버튼들
              RecipeCategoryPanel(),
              SizedBox(height: 30),
              //재료 입력 텍스트 필드
              IngredientsTextField(),
              SizedBox(height: 30),
              //설명을 입력하는 텍스트필드&이미지 위젯 리스트
              ...buildRecipeExplainAndImgSets(recipeExplainInputs),
              const SizedBox(height: 10),
              //설명과 사진 입력 세트 추가버튼
              _addRecipeExplainAndImgSetButton(),
              const SizedBox(height: 30),
              //완성된 요리 모습 업로드
              CompletedRecipe(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _addManualAndImgSet() {
    // 새로운 컨트롤러와 TextField 추가
    recipeExplainInputs.add(
      RecipeExplainInput(
        textEditingController: TextEditingController(),
        globalKeyForScroll: GlobalKey(),
      ),
    );
  }

  void _scrollToNextManualWidget() {
    // 추가 버튼 누르면 다음 위젯 위치로 스크롤 되도록
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      final context =
          recipeExplainInputs.last.globalKeyForScroll.currentContext;
      // print(globalKeys);
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      } else {
        print('Context is null, ensureVisible not called.');
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
      print('페이지 끝 위치: ${_scrollController.position.maxScrollExtent},'
          ' 현재 위치: ${_scrollController.position.pixels}');
    });
  }

  Widget _addRecipeExplainAndImgSetButton() {
    //설명과 이미지 세트 추가하는 버튼. 세트가 20개 이하일때까지만 보인다.
    return Visibility(
      visible: recipeExplainInputs.length <= 19,
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {
            setState(() {
              _addManualAndImgSet();
              _scrollToNextManualWidget();
            });
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: pointColor,
          ),
        ),
      ),
    );
  }
}
