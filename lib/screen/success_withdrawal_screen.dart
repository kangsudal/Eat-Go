import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessWithdrawalScreen extends StatelessWidget {
  const SuccessWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('탈퇴 처리가 완료되었습니다.'),
            CupertinoButton(
              child: Text('로그인 페이지로 가기'),
              onPressed: () {
                context.go('/sign_in');
              },
            ),
          ],
        ),
      ),
    );
  }
}
