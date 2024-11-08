import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/camera_button.dart';
import 'package:flutter/material.dart';

//재료 입력 테스트 필드
class IngredientsTextAndImgInput extends StatelessWidget {
  const IngredientsTextAndImgInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('재료', style: TextStyle(fontSize: 15)),
        const SizedBox(height: 8),
        TextFormField(
          minLines: 5,
          maxLines: 5,
          maxLength: 200,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EatGoPalette.lineColor, width: 1),
            ),
          ),
        ),const SizedBox(height: 8),
        const CameraButton(),
      ],
    );
  }
}
