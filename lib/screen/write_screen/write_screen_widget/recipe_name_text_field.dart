import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/viewmodels/recipe_write_base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//레시피 이름을 입력하는 텍스트 필드
class RecipeNameTextField extends ConsumerWidget {
  final RecipeWriteBaseViewModel viewModel;

  const RecipeNameTextField({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '레시피 이름',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLength: 30,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EatGoPalette.lineColor, width: 1),
            ),
          ),
          validator: (value) => viewModel.validateTitle(value ?? ''),
          onSaved: (value) {
            viewModel.updateTitle(value ?? '');
          },
        ),
      ],
    );
  }
}
