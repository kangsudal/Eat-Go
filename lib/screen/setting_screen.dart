import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/model/user_model.dart';
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
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingViewState = ref.watch(settingViewModelProvider);
    final settingViewModel = ref.read(settingViewModelProvider.notifier);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('SETTING'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  settingViewState.when(
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      debugPrint('SettingScreen 오류 발생 - 회원 설정 화면: $error');
                      // 에러 발생 시 SnackBar 표시
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('오류가 발생했습니다.')),
                      );
                      return const Text('오류 발생');
                    },
                    data: (EatGoUser? user) {
                      if (user == null) {
                        // debugPrint(
                        //     'SettingScreen 오류 발생 - 회원 설정 화면: EatGoUser 리턴값이 null입니다.');
                        return const Text('로그인된 사용자가 없습니다.');
                      }
                      return Column(
                        children: [
                          ListTile(
                            title: Text('안녕하세요! ${user.displayName}님.'),
                          ),
                          ListTile(
                            leading: Text('Email:'),
                            title: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(user.email),
                            ),
                          ),
                          ListTile(
                            title: const Text('푸쉬 알림설정'),
                            trailing: CupertinoSwitch(
                              value: user.pushNotificationEnabled,
                              onChanged: (isEnabled) {
                                // 로컬 상태 업데이트 (Firestore에는 아직 저장하지 않음)
                                settingViewModel
                                    .togglePushNotification(isEnabled);
                              },
                              activeColor: pointColor,
                              trackColor: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // 저장 버튼을 눌렀을 때 Firestore에 저장 로직 호출
                      final result = await settingViewModel.saveSettings();
                      if (result) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('설정이 저장되었습니다.')),
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('설정 저장이 실패 되었습니다.')),
                          );
                        }
                      }
                    },
                    child: const Text('저장'),
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
                          onPressed: () async {
                            try {
                              await settingViewModel.signOut();
                            } catch (e) {
                              debugPrint(
                                  'SettingScreen 오류 발생 - 로그아웃 처리에 오류가 발생하였습니다.$e');
                            }
                          },
                        ),
                        TextButton(
                          child: const Text('탈퇴하기'),
                          onPressed: () {
                            handleWithdrawal();
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
        if (settingViewState is AsyncLoading)
          Container(
            color: Colors.white.withOpacity(1), // 반투명 배경
            child: const Center(
              child: CircularProgressIndicator(), // 중앙에 로딩 인디케이터
            ),
          ),
      ],
    );
  }

  void handleWithdrawal() async {
    final settingViewModel = ref.read(settingViewModelProvider.notifier);
    // 페이지가 닫히기 전에 상태를 복원(저장안하고 떠났을때)
    final currentUser = ref.read(settingViewModelProvider).asData?.value;
    try {
      // 계정 및 데이터 삭제
      final result = await settingViewModel.deleteUserAccountAndData();

      if (result == false) {
        debugPrint('SettingScreen 오류 발생 - 회원 설정 화면: EatGoUser 리턴값이 null입니다.');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('오류가 발생했습니다.')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('성공적으로 탈퇴 처리가 되었습니다.')),
          );
        }
      }
    } catch (e) {
      debugPrint('SettingScreen 오류 발 생 - 계정 삭제 실패 : $e');
    }
  }
}
