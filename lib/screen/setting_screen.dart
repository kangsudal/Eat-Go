import 'package:eat_go/eatgo_providers.dart';
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
  late EatGoUser? originalUser; // Firestore에서 불러온 초기 상태 저장

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 최초의 Firestore에서 불러온 상태를 저장
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    final settingViewModel = ref.read(settingViewModelProvider.notifier);
    originalUser = await settingViewModel.getUser(); // 원래 사용자 데이터 불러오기
  }

  @override
  void dispose() {
    final currentUser = ref.read(settingViewModelProvider).asData?.value;
    // 로컬 상태와 Firestore에서 불러온 원래 상태를 비교
    if (originalUser != null &&
        currentUser != null &&
        currentUser != originalUser) {
      final settingViewModel = ref.read(settingViewModelProvider.notifier);
      // 만약 저장되지 않은 변경사항이 있다면, 원래 상태로 되돌림
      settingViewModel.resetToOriginal(originalUser);
    }
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
                        debugPrint(
                            'SettingScreen 오류 발생 - 회원 설정 화면: EatGoUser 리턴값이 null입니다.');
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
                            await settingViewModel.signOut();
                          },
                        ),
                        TextButton(
                          child: const Text('탈퇴하기'),
                          onPressed: () async {
                            handleWithdrawal(context);
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
            color: Colors.black.withOpacity(0.5), // 반투명 배경
            child: const Center(
              child: CircularProgressIndicator(), // 중앙에 로딩 인디케이터
            ),
          ),
      ],
    );
  }

  void handleWithdrawal(BuildContext context) async {
    final settingViewModel = ref.read(settingViewModelProvider.notifier);

    // 계정 및 데이터 삭제
    final result = await settingViewModel.deleteUserAccountAndData();

    if (result) {
      // 사용자 로드 성공 시 화면 이동
      if (context.mounted) {
        context.go('/success_withdrawal');
      }
    } else if (result == false) {
      debugPrint('Screen 오류 발생 - 회원 설정 화면: EatGoUser 리턴값이 null입니다.');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('오류가 발생했습니다.')),
        );
      }
    }
  }
}
