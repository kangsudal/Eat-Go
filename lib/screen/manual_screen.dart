import 'package:eat_go/model/fake_recipe.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: pointColor,
        onPressed: () {
          print('OK');
        },
        tooltip: "오늘은 이 메뉴로 확정",
        child: Text(
          '식당',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    onPressed: () {},
                    color: pointColor,
                    child: Text(
                      '오늘은 이 메뉴로 확정',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Tooltip(
                    message: '전체 사용자가 확정한 수입니다.',
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: pointColor,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '32',
                          style: TextStyle(
                            color: pointColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          elevation: 1,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          title: Text(
                            '댓글 9',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        body: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text('$index'),
                                  );
                                },
                                itemCount: 20,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(
                                    thickness: 0.5,
                                  );
                                },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
