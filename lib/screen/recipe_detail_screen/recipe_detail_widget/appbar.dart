import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        const Tooltip(
            message: '카레 크림 파스타aaaaaaaa', child: Text('카레 크림 파스타aaaaaaaa')),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Tooltip(
              message: '전체 조회수입니다.',
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: pointColor,
                    size: 20,
                  ),
                  SizedBox(width:5),
                  Text(
                    '0',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Tooltip(
              message: '이 레시피를 북마크한 전체 사용자 수입니다.',
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: pointColor,
                    size: 20,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Tooltip(
              message: '이 레시피가 박수갈채 받은 수입니다.',
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/icon-clap.png',
                    color: pointColor,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width:5),
                  const Text(
                    '0',
                    style: TextStyle(
                      color: pointColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),*/
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.bookmark,
          color: pointColor,
        ),
      ),
      // PopupMenuButton(
      //   iconColor: pointColor,
      //   itemBuilder: (BuildContext context) {
      //     return [
      //       const PopupMenuItem(
      //         child: Text('공유하기'),
      //       ),
      //       const PopupMenuItem(
      //         child: Text('레시피 신고하기'),
      //       ),
      //       const PopupMenuItem(
      //         child: Text('작성자 신고하기'),
      //       ),
      //     ];
      //   },
      // ),
    ],
  );
}
