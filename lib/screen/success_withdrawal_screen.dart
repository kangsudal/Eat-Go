import 'package:eat_go/eatgo_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SuccessWithdrawalScreen extends ConsumerStatefulWidget {
  const SuccessWithdrawalScreen({super.key});

  @override
  ConsumerState<SuccessWithdrawalScreen> createState() =>
      _SuccessWithdrawalScreenState();
}

class _SuccessWithdrawalScreenState
    extends ConsumerState<SuccessWithdrawalScreen> {
  @override
  void initState() {
    super.initState();

    // 페이지가 로드된 후 상태 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final userViewModel = ref.read(userViewModelProvider.notifier);
        userViewModel.resetState(); // 상태 초기화
      }
    });
  }

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
