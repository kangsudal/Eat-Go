// auth_view_model.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eat_go/services/auth_service.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:flutter/cupertino.dart';

class SignInViewModel {
  final AuthService authService;
  final UserService userService;

  SignInViewModel({required this.authService, required this.userService});

  // Google 로그인 및 사용자 정보 저장
  Future<bool> signInWithGoogle() async {
    try {
      // Google 로그인 처리
      UserCredential? userCredential =
          await authService.authenticateWithGoogle();

      // 로그인 성공 시 Firestore에 사용자 정보 저장
      if (userCredential != null) {
        User? user = userCredential.user;
        if (user != null) {
          await userService.saveUser(user);
          return true; // 로그인 성공
        }
      }
      return false;
    } catch (e) {
      debugPrint('Google 로그인 중 오류 발생: $e');
      return false;
    }
  }

  // 로그아웃 처리
  Future<void> signOut() async {
    await authService.signOut();
  }
}
