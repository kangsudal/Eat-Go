// auth_view_model.dart
import 'dart:async';

import 'package:eat_go/provider/eatgo_providers.dart';
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
          await ref.read(currentEatGoUserProvider.notifier).getCurrentUser();
          //☆☆☆☆☆☆ 없으면 saveUser(user) 하기전에 HomeScreen에서 currentEatGoUser를 먼저 호출하여 null값이 들어감. 강제로 재갱신해줘야함.
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

  // Apple 로그인 및 사용자 정보 저장
  Future<void> signInWithApple() async {
    try {
      state = const AsyncValue.loading();

      // Apple 로그인 처리
      authRepository.authenticateWithApple().then((userCredential) async {
        //로그인 성공 시 Firestore에 사용자 정보 저장
        if (userCredential != null) {
          User? user = userCredential.user;
          if (user != null) {
            await userRepository.saveUser(user);
            // 강제 데이터 갱신 todo:무조건 이해하기
            await ref.read(currentEatGoUserProvider.notifier).getCurrentUser();
            //☆☆☆☆☆☆ 없으면 saveUser(user) 하기전에 HomeScreen에서 currentEatGoUser를 먼저 호출하여 null값이 들어감. 강제로 재갱신해줘야함.
            state = const AsyncValue.data(
                null); // 로그인 성공 상태 todo:null보단 구체적 상태값을 갖도록.
          }
        } else {
          state =
              AsyncValue.error('Apple 로그인 실패: 사용자 정보 없음', StackTrace.current);
          throw Exception('사용자 정보 없음');
        }
      });
    } catch (e, stackTrace) {
      debugPrint('SignInViewModel 오류 발생 - Apple 로그인 중 오류 발생: $e');
      state = AsyncValue.error(e, stackTrace); // 에러 상태로 전환
      throw Exception(e);
    }
  }

  // 이메일 로그인 및 사용자 정보 저장
  Future<void> signInWithEmail() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 전환

      User? user = await authRepository.currentUser();

      // 로그인 성공 시 Firestore에 사용자 정보 저장
      if (user != null) {
        await userRepository.saveUser(user);
        await ref.read(currentEatGoUserProvider.notifier).getCurrentUser();
        //☆☆☆☆☆☆ 없으면 saveUser(user) 하기전에 HomeScreen에서 currentEatGoUser를 먼저 호출하여 null값이 들어감. 강제로 재갱신해줘야함.
        state = const AsyncValue.data(null); // 로그인 성공 상태
      }

      state = AsyncValue.error(
          '이메일 로그인 실패: 사용자 정보 없음', StackTrace.current); // 실패 상태 설정
    } catch (e, stackTrace) {
      debugPrint('SignInViewModel 오류 발생 - 이메일 로그인 중 오류 발생: $e');
      state = AsyncValue.error(e, stackTrace); // 에러 상태로 전환
    }
  }
}
