import 'dart:io';

import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/write_screen/write_screen.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/camera_button.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/recipe_explain_input.dart';
import 'package:flutter/material.dart';

//설명을 입력하는 텍스트필드&이미지 위젯 리스트 생성
List<Widget> buildRecipeExplainAndImgInputSets(
    List<RecipeExplainInput> recipeExplainInputs) {
  return List.generate(recipeExplainInputs.length, (index) {
    return RecipeExplainAndImg(
        index: index, recipeExplainInputs: recipeExplainInputs);
  });
}

class RecipeExplainAndImg extends StatelessWidget {
  final int index;
  final List<RecipeExplainInput> recipeExplainInputs;
  const RecipeExplainAndImg({
    super.key,
    required this.index,
    required this.recipeExplainInputs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: recipeExplainInputs[index].globalKeyForScroll,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('설명${index + 1}', style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 8),
        TextField(
          controller: recipeExplainInputs[index].textEditingController,
          minLines: 4,
          maxLines: 4,
          maxLength: 150,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EatGoPalette.lineColor, width: 1),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const CameraButton(),
        if (index != recipeExplainInputs.length - 1) const SizedBox(height: 30),
      ],
    );
  }
}