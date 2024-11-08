import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/write_screen/write_screen_widget/camera_button.dart';
import 'package:eat_go/viewmodels/recipe_write_base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//재료 입력 테스트 필드
class IngredientsTextAndImgInput extends ConsumerWidget {
  final RecipeWriteBaseViewModel viewModel;
  const IngredientsTextAndImgInput({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        ),
        const SizedBox(height: 8),
        CameraButton(
          viewModel: viewModel,
        ),
      ],
    );
  }
}
