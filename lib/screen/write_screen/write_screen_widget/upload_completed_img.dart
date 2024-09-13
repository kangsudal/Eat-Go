import 'dart:io';

import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//완성된 요리 모습 업로드
class UploadCompletedImg extends StatefulWidget {
  final VoidCallback? scrollToBottom;

  const UploadCompletedImg(this.scrollToBottom, {super.key});

  @override
  State<UploadCompletedImg> createState() => _UploadCompletedImgState();
}

class _UploadCompletedImgState extends State<UploadCompletedImg> {
  File? imageFile;

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
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  imageFile!,
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (frame != null || wasSynchronouslyLoaded) {
                      if(widget.scrollToBottom!=null) {
                        print("바닥으로${widget.scrollToBottom}");//todo: 한번 완성된 레시피 사진을 올리면, scrollToBottom이 자꾸 호출되게 됨
                        widget.scrollToBottom!();
                      }
                    }
                    return child;
                  },
                ),
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
}
