import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const BorderRadiusGeometry sheetBorderRadius =
        BorderRadius.all(Radius.circular(10.0));
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: sheetBorderRadius,
          ),
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: sheetBorderRadius,
              child: FractionallySizedBox(
                heightFactor: 0.9,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                          const Text('댓글'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomListTile(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              leading: Container(),
                              mid: Column(
                                children: [
                                  title(),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                  ),
                                ],
                              ),
                              trailing: PopupMenuButton(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: pointColor,
                                ),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    const PopupMenuItem(
                                      child: Text('차단하기'),
                                    ),
                                    const PopupMenuItem(
                                      child: Text('신고하기'),
                                    ),
                                  ];
                                },
                              ),
                            ),
                          );
                        },
                        itemCount: 20,
                      ),
                    ),
                    Container(
                      // height:30,
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: EatGoPalette.lineColor,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: '댓글을 입력해주세요 :)',
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              '등록',
                              style: TextStyle(
                                color: pointColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        // color: Colors.amber,
        child: const Row(
          children: [
            Icon(
              Icons.insert_comment_outlined,
              color: pointColor,
            ),
            SizedBox(width: 3),
            Text(
              '9',
              style: TextStyle(color: pointColor),
            ),
          ],
        ),
      ),
    );
  }

  Row title() {
    return Row(
      children: [
        const Text(
          'kangsudal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 3),
        const Icon(
          Icons.check_circle_outline,
          color: pointColor,
          size: 16,
        ),
        const Text(
          '4',
          style: TextStyle(color: pointColor),
        ),
        const SizedBox(width: 10),
        Text(
          '1994.01.24',
          style: TextStyle(
            color: EatGoPalette.subTextColor,
          ),
        ),
      ],
    );
  }
}
