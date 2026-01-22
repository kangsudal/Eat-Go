import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PathErrorScreen extends StatelessWidget {
  const PathErrorScreen({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    logger.e(error);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('잘못된 접속 경로입니다.'),
            CupertinoButton(
              child: const Text('홈으로 가기'),
              onPressed: () {
                context.go('/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
