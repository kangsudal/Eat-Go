import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/build_recipe_explain_and_img_sets.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/completed_recipe.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/ingredients_text_and_img_input.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/recipe_category_panel.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/recipe_explain_input.dart';
import 'package:eat_go/screen/recipe_write_screen/recipe_write_screen_widget/recipe_name_text_field.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeWriteScreen extends ConsumerStatefulWidget {
  const RecipeWriteScreen({
    super.key,
    this.isEditMode = false,
  });
  final bool isEditMode;

  @override
  ConsumerState<RecipeWriteScreen> createState() => _RecipeWriteScreenState();
}

class _RecipeWriteScreenState extends ConsumerState<RecipeWriteScreen> {
  final ScrollController _scrollController = ScrollController();
  List<RecipeExplainInput> recipeExplainInputs = [
    RecipeExplainInput(
      textEditingController: TextEditingController(),
      globalKeyForScroll: GlobalKey(), //스크롤을 위해 설명 widget들에게 할당해줌
    ),
  ];
  final formKey = GlobalKey<FormState>();

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
    final viewModel = ref.watch(
      widget.isEditMode
          ? recipeEditViewModelProvider.notifier
          : recipeCreateViewModelProvider.notifier,
    );

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
        title: Text(widget.isEditMode ? '레시피 수정' : '레시피 작성'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              //writeData.upload();
            },
            child: const Text('Post'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //레시피 이름을 입력하는 텍스트 필드
                RecipeNameTextField(
                  viewModel: viewModel,
                ),
                const SizedBox(height: 30),
                //레시피 종류를 입력하는 라디오 버튼들
                const RecipeCategoryPanel(),
                const SizedBox(height: 30),
                //재료 입력 텍스트 필드
                IngredientsTextAndImgInput(viewModel: viewModel),
                const SizedBox(height: 30),
                //설명을 입력하는 텍스트필드&이미지 위젯 리스트
                ...buildRecipeExplainAndImgInputSets(
                  recipeExplainInputs: recipeExplainInputs,
                  viewModel: viewModel,
                ),
                const SizedBox(height: 10),
                //설명과 사진 입력 세트 추가버튼
                _addRecipeExplainAndImgSetButton(),
                const SizedBox(height: 30),
                //완성된 요리 모습 업로드
                CompletedRecipe(
                  viewModel: viewModel,
                ),
                const SizedBox(height: 30),
              ],
            ),
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
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      } else {
        logger.e('Context is null, ensureVisible not called.');
      }
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
