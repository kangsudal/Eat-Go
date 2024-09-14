import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry sheetBorderRadius =
        BorderRadius.all(Radius.circular(10.0));
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: sheetBorderRadius,
          ),
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: sheetBorderRadius,
              child: FractionallySizedBox(
                heightFactor: 0.9,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                          Text('댓글'),
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
                                  SizedBox(height: 10),
                                  Text(
                                      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                                ],
                              ),
                              trailing: Container(
                                // color: Colors.blue,
                                child: PopupMenuButton(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: pointColor,
                                  ),
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        child: Text('차단하기'),
                                      ),
                                      PopupMenuItem(
                                        child: Text('신고하기'),
                                      ),
                                    ];
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 20,
                      ),
                    ),
                    Container(
                      // height:30,
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: EatGoPalette.lineColor,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: '댓글을 입력해주세요 :)'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
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
        child: Row(
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
        Text(
          'kangsudal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 3),
        Icon(
          Icons.check_circle_outline,
          color: pointColor,
          size: 16,
        ),
        Text(
          '4',
          style: TextStyle(color: pointColor),
        ),
        SizedBox(width: 10),
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
