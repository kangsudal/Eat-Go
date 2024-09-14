import 'package:eat_go/screen/write_screen/write_screen_widget/camera_button.dart';
import 'package:flutter/material.dart';

class CompletedRecipe extends StatelessWidget {
  const CompletedRecipe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('완성된 요리 모습', style: TextStyle(fontSize: 15)),
        SizedBox(height: 8),
        CameraButton(),
      ],
    );
  }
}
