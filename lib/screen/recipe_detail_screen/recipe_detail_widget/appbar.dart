import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Wrap(
      children: [
        Tooltip(message: '카레 크림 파스타aaaaaaaa', child: Text('카레 크림 파스타aaaaaaaa')),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Tooltip(
                message: '전체 조회수입니다.',
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: pointColor,
                      size: 20,
                    ),
                    Text(
                      '32',
                      style: TextStyle(
                        color: pointColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Tooltip(
                message: '이 레시피를 북마크한 전체 사용자 수입니다.',
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: pointColor,
                      size: 20,
                    ),
                    Text(
                      '32',
                      style: TextStyle(
                        color: pointColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Tooltip(
                message: '이 레시피의 전체 채택 수입니다.',
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: pointColor,
                      size: 20,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        color: pointColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
      PopupMenuButton(
        iconColor: pointColor,
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              child: Text('공유하기'),
            ),
            const PopupMenuItem(
              child: Text('신고하기'),
            ),
            const PopupMenuItem(
              child: Text('차단하기'),
            ),
          ];
        },
      ),
    ],
  );
}
