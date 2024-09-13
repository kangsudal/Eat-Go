import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/write_screen/write_screen.dart';
import 'package:flutter/material.dart';

//설명을 입력하는 텍스트필드&이미지 위젯 리스트 생성
List<Widget> buildRecipeExplainAndImgSets(
    List<RecipeExplainInput> recipeExplainInputs) {
  return List.generate(recipeExplainInputs.length, (index) {
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
        Container(
          height: 43,
          decoration: BoxDecoration(
            border: Border.all(color: pointColor),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                color: pointColor,
              ),
              Text(
                '사진 첨부하기',
                style: TextStyle(
                  color: pointColor,
                ),
              ),
            ],
          ),
        ),
        if (index != recipeExplainInputs.length - 1) const SizedBox(height: 30),
      ],
    );
  });
}
