import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(settingViewModelProvider);
    final userViewModel = ref.read(settingViewModelProvider.notifier);
    // 상태 변화에 따른 처리
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userState.when(
        loading: () {
          // 로딩 중에는 별도의 처리 없이 CircularProgressIndicator를 표시함
        },
        error: (error, stackTrace) {
          debugPrint('SettingScreen 오류 발생 - 회원 탈퇴 화면-1: $error');
          // 에러 발생 시 SnackBar 표시
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('오류가 발생했습니다.')),
          );
        },
        data: (result) {
          if (result.data == true) {
            // 성공 시 화면 이동
            context.go('/success_withdrawal');
          } else if (result.data == false) {
            // 작업 실패 시 SnackBar 표시
            if (result.error != null && result.error!.isNotEmpty) {
              debugPrint('Screen 오류 발생 - 회원 탈퇴 화면-2: ${result.error}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('오류가 발생했습니다.')),
              );
            }
          }
        },
      );
    });
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('SETTING'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                30,
                30,
                30,
                30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('푸쉬 알림설정'),
                    trailing: CupertinoSwitch(
                      value: value,
                      onChanged: (isTrue) {
                        setState(() {
                          value = isTrue;
                        });
                      },
                      activeColor: pointColor,
                      trackColor: Colors.black,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text('로그아웃'),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('탈퇴하기'),
                          onPressed: () async {
                            // 계정 및 데이터 삭제
                            await userViewModel.deleteUserAccountAndData();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 로딩 상태 처리 (Stack을 사용해 전체 화면에 CircularProgressIndicator 추가)
        ),
        if (userState is AsyncLoading)
          Container(
            color: Colors.black.withOpacity(0.5), // 반투명 배경
            child: const Center(
              child: CircularProgressIndicator(), // 중앙에 로딩 인디케이터
            ),
          ),
      ],
    );
  }
}
