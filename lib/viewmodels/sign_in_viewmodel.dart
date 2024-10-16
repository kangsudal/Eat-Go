// auth_view_model.dart
import 'dart:async';

import 'package:eat_go/eatgo_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends AsyncNotifier<void> {
  late final AuthRepository authRepository;
  late final UserRepository userRepository;

  @override
  FutureOr<void> build() async {
    authRepository = ref.read(authRepositoryProvider);
    userRepository = ref.read(userRepositoryProvider);
  }

  // Google 로그인 및 사용자 정보 저장
  Future<bool> signInWithGoogle() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 전환

      // Google 로그인 처리
      UserCredential? userCredential =
          await authRepository.authenticateWithGoogle();

      // 로그인 성공 시 Firestore에 사용자 정보 저장
      if (userCredential != null) {
        User? user = userCredential.user;
        if (user != null) {
          await userRepository.saveUser(user);
          state = const AsyncValue.data(null); // 로그인 성공 상태
          return true; // 로그인 성공
        }
      }
      state = AsyncValue.error(
          'Google 로그인 실패: 사용자 정보 없음', StackTrace.current); // 실패 상태 설정
      return false;
    } catch (e, stackTrace) {
      debugPrint('SignInViewModel 오류 발생 - Google 로그인 중 오류 발생: $e');
      state = AsyncValue.error(e, stackTrace); // 에러 상태로 전환
      return false;
    }
  }

  // Google 로그인 및 사용자 정보 저장
  Future<bool> signInWithApple() async {
    try {
      state = const AsyncValue.loading();

      // Apple 로그인 처리
      UserCredential? userCredentila =
          await authRepository.authenticateWithApple();

      //로그인 성공 시 Firestore에 사용자 정보 저장
      if (userCredentila != null) {
        User? user = userCredentila.user;
        if (user != null) {
          await userRepository.saveUser(user);
          state = const AsyncValue.data(null); // 로그인 성공 상태
          return true;
        }
      }
      state = AsyncValue.error(
          'Apple 로그인 실패: 사용자 정보 없음', StackTrace.current);
      return false;
    } catch (e, stackTrace) {
      debugPrint('SignInViewModel 오류 발생 - Apple 로그인 중 오류 발생: $e');
      state = AsyncValue.error(e, stackTrace); // 에러 상태로 전환
      return false;
    }
  }

  // 로그아웃 처리
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await authRepository.signOut();
      state = const AsyncValue.data(null); // 로그아웃 성공 시 상태 업데이트
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      debugPrint('로그아웃 중 오류 발생: $e');
    }
  }
}
