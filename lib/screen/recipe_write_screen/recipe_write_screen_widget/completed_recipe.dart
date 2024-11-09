import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/camera_button.dart';
import 'package:eat_go/viewmodels/recipe_write_base_viewmodel.dart';
import 'package:flutter/material.dart';

class CompletedRecipe extends StatelessWidget {
  final RecipeWriteBaseViewModel viewModel;

  const CompletedRecipe({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('완성된 요리 모습', style: TextStyle(fontSize: 15)),
        SizedBox(height: 8),
        CameraButton(viewModel: viewModel),
      ],
    );
  }
}
