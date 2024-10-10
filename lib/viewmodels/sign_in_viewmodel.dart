// auth_view_model.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eat_go/services/auth_service.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends StateNotifier<AsyncValue<void>> {
  final AuthService authService;
  final UserService userService;

  SignInViewModel({required this.authService, required this.userService})
      : super(const AsyncValue.data(null));

  // Google 로그인 및 사용자 정보 저장
  Future<bool> signInWithGoogle() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 전환

      // Google 로그인 처리
      UserCredential? userCredential =
          await authService.authenticateWithGoogle();

      // 로그인 성공 시 Firestore에 사용자 정보 저장
      if (userCredential != null) {
        User? user = userCredential.user;
        if (user != null) {
          await userService.saveUser(user);
          state = const AsyncValue.data(null); // 로그인 성공 상태
          return true; // 로그인 성공
        }
      }
      state = AsyncValue.error(
          'Google 로그인 실패: 사용자 정보 없음', StackTrace.current); // 실패 상태 설정
      return false;
    } catch (e, stackTrace) {
      debugPrint('Google 로그인 중 오류 발생: $e');
      state = AsyncValue.error(e, stackTrace); // 에러 상태로 전환
      return false;
    }
  }

  // 로그아웃 처리
  Future<void> signOut() async {
    await authService.signOut();
  }
}
