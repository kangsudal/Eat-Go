import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Wrap(
      children: [
        Tooltip(message: '카레 크림 파스타aaaaaaaa', child: Text('카레 크림 파스타aaaaaaaa')),
        Tooltip(
          message: '전체 사용자가 확정한 수입니다.',
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: pointColor,
                size: 20,
              ),
              SizedBox(width: 3),
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
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.share,
          color: pointColor,
        ),
      ),
      PopupMenuButton(
        iconColor: pointColor,
        itemBuilder: (BuildContext context) {
          return [
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
