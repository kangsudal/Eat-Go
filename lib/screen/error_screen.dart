import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    debugPrint(error);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('잘못된 접속 경로입니다.'),
            CupertinoButton(
              child: Text('홈으로 가기'),
              onPressed: () {
                context.go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
