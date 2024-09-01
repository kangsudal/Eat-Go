import 'dart:io';

import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  // TextEditingController 리스트
  List<TextEditingController> _manualTextEditingControllers = [
    TextEditingController()
  ];
  final ScrollController _scrollController = ScrollController();
  final manualExplainGlobalKeys = <GlobalKey>[
    GlobalKey()
  ]; //스크롤을 위해 설명 widget들에게 할당해줌

  // @override
  // void initState() {
  //   super.initState();
  //
  //   // 스크롤 위치가 변경될 때마다 호출되는 리스너를 추가
  //   _scrollController.addListener(() {
  //     print('현재 스크롤 위치: ${_scrollController.position.pixels}');
  //   });
  // }

  @override
  void dispose() {
    // 모든 컨트롤러를 해제
    for (var controller in _manualTextEditingControllers) {
      controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  void _addManualAndImgSet() {
    // 새로운 컨트롤러와 TextField 추가
    _manualTextEditingControllers.add(TextEditingController());
    manualExplainGlobalKeys.add(GlobalKey());
  }

  void _scrollToNextManualWidget() {
    // 추가 버튼 누르면 다음 위젯 위치로 스크롤 되도록
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      final context = manualExplainGlobalKeys.last.currentContext;
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

  List<Widget> buildManualAndImgSets() {
    return List.generate(_manualTextEditingControllers.length, (index) {
      return Column(
        key: manualExplainGlobalKeys[index],
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('설명${index + 1}', style: const TextStyle(fontSize: 15)),
          const SizedBox(height: 8),
          TextField(
            controller: _manualTextEditingControllers[index],
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
          if (index != _manualTextEditingControllers.length - 1)
            const SizedBox(height: 30),
        ],
      );
    });
  }

  Widget addSetButton() {
    if (_manualTextEditingControllers.length <= 19) {
      return Align(
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
      );
    } else {
      return Container();
    }
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
            onPressed: () {},
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
              //레시피 이름
              RecipeNameTextField(),
              SizedBox(height: 30),
              //종류
              RecipeCategoryPanel(),
              SizedBox(height: 30),
              //재료
              IngredientsTextField(),
              SizedBox(height: 30),
              //설명과 사진
              ...buildManualAndImgSets(),
              const SizedBox(height: 10),
              //설명과 사진 입력 세트 추가버튼(20개까지만 만들 수 있도록 막음)
              addSetButton(),
              const SizedBox(height: 30),
              //완성된 모습 업로드
              UploadCompletedImg(_scrollToBottom),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeNameTextField extends StatelessWidget {
  const RecipeNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
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
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EatGoPalette.lineColor, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

enum MenuCategory {
  rice, // 밥
  dessert, // 후식
  sideDish, // 반찬
  mainDish, // 일품
  soupStew, // 국&찌개
  others // 기타
}

class RecipeCategoryPanel extends StatefulWidget {
  const RecipeCategoryPanel({super.key});

  @override
  State<RecipeCategoryPanel> createState() => _RecipeCategoryPanelState();
}

class _RecipeCategoryPanelState extends State<RecipeCategoryPanel> {
  MenuCategory selectedValueGroup1 = MenuCategory.rice; // 선택된 값을 저장할 변수
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '종류',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.rice,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('밥'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.dessert,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('후식'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.sideDish,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('반찬'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.mainDish,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                        print(selectedValueGroup1);
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('일품'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.soupStew,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                        print(selectedValueGroup1);
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('국&찌개'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: MenuCategory.others,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                      });
                    },
                  ),
                  FittedBox(
                    child: Text('기타'),
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class IngredientsTextField extends StatelessWidget {
  const IngredientsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('재료', style: TextStyle(fontSize: 15)),
        const SizedBox(height: 8),
        TextField(
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
      ],
    );
  }
}

class UploadCompletedImg extends StatefulWidget {
  final VoidCallback scrollToBottom;

  const UploadCompletedImg(this.scrollToBottom, {super.key});

  @override
  State<UploadCompletedImg> createState() => _UploadCompletedImgState();
}

class _UploadCompletedImgState extends State<UploadCompletedImg> {
  File? imageFile;

  Future<void> chooseImage(ImageSource cameraOrGallery) async {
    Navigator.of(context).pop();
    try {
      final XFile? pickedImage =
          await ImagePicker().pickImage(source: cameraOrGallery);

      if (pickedImage != null) {
        String imagePath = pickedImage.path;
        setState(() {
          imageFile = File(imagePath);
        });
      }
    } catch (errorMsg) {
      print(errorMsg.toString());
      setState(() {
        imageFile = null;
      });
    } finally {
      // widget.scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('완성된 요리 모습', style: TextStyle(fontSize: 15)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            buildShowDialog(context);
          },
          child: Visibility(
            visible: imageFile == null,
            child: Container(
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
          ),
        ),
        if (imageFile != null)
          Stack(
            children: [
              ClipRRect(
                child: Image.file(
                  imageFile!,
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (frame != null || wasSynchronouslyLoaded) {
                      widget.scrollToBottom();
                    }
                    return child;
                  },
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    buildShowDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFFE1E1E1),
                    child: Icon(
                      size: 18,
                      Icons.edit_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      imageFile = null;
                    });
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFFE1E1E1),
                    child: Icon(
                      size: 18,
                      Icons.close_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('사진첩에서 가져오기'),
              onTap: () async {
                await chooseImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('카메라로 촬영하기'),
              onTap: () async {
                await chooseImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }
}
