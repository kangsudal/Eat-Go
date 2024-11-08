import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/viewmodels/write_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//레시피 이름을 입력하는 텍스트 필드
class RecipeNameTextField extends ConsumerWidget {
  const RecipeNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final writeViewModel = ref.read(writeViewModelProvider.notifier);
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
          validator: (value) => writeViewModel.validateTitle(value ?? ''),
          onSaved: (value) {
            writeViewModel.updateTitle(value ?? '');
          },
        ),
      ],
    );
  }
}
