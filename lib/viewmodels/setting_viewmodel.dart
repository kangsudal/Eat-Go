import 'dart:async';

import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/model/operation_result.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingViewModel extends AsyncNotifier<EatGoUser?> {
  late final AuthRepository _authRepository;
  late final UserRepository _userRepository;

  @override
  FutureOr<EatGoUser?> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    _userRepository = ref.watch(userRepositoryProvider);
    return await getUser();
  }

  // 사용자 계정 삭제 및 데이터 삭제
  Future<bool> deleteUserAccountAndData() async {
    try {
      // 1. 현재 로그인된 사용자 UID 가져오기
      String? uid = _authRepository.getCurrentUserUid();
      if (uid == null) return false;
      // 2. 계정 삭제
      await _authRepository.deleteUserAccount();
      // 3. Firestore에서 사용자 데이터 삭제
      await _userRepository.deleteUserData(uid);
      return true;
    } catch (e) {
      debugPrint('SettingViewModel 오류 발생 - 회원 탈퇴 중 오류: $e');
      return false;
    }
  }

  // 로그아웃 처리
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signOut();
      state = const AsyncValue.data(null); // 로그아웃 성공 시 상태 업데이트
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      debugPrint('로그아웃 중 오류 발생: $e');
    }
  }

  Future<EatGoUser?> getUser() async {
    String? currentUserUid = _authRepository.getCurrentUserUid();
    if (currentUserUid != null) {
      Map<String, dynamic>? userMap =
          await _userRepository.getUser(currentUserUid);
      return EatGoUser.fromJson(userMap!);
    } else {
      debugPrint('SettingViewModel 오류 발생 - getUser()값이 null로 반환');
      return null;
    }
  }
}
