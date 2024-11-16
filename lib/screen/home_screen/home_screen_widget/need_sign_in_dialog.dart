import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NeedSignInDialog extends StatelessWidget {
  const NeedSignInDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('로그인이 필요한 기능입니다.'),
      actions: [
        TextButton(
          child: const Text(
            '닫기',
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
          child: const Text('로그인'),
          onPressed: () {
            context.go('/sign_in');
          },
        ),
      ],
    );
  }
}
