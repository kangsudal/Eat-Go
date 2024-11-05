// auth_repository.dart
// AuthRepository: Firebase Auth와 관련된 작업(로그인, 로그아웃, UID 가져오기 등)을 관리.
import 'package:eat_go/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required authService}) : _authService = authService;

  String? getCurrentUserUid() {
    return _authService.getCurrentUserUid();
  }

  // 사용자 계정 삭제
  Future<void> deleteUserAccount() async {
    try {
      await _authService.deleteUserAccount(); // Firebase Authentication에서 계정 삭제
    } catch (e) {
      debugPrint('AuthRepository 오류 발생 - 계정 삭제 실패: $e');
    }
  }

  Future<bool> reauthenticateWithSocialLogin() async {
    return await _authService.reauthenticateWithSocialLogin();
  }

  Future<UserCredential?> authenticateWithGoogle() async {
    return await _authService.authenticateWithGoogle();
  }

  Future<UserCredential?> authenticateWithApple() async {
    return await _authService.authenticateWithApple();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
