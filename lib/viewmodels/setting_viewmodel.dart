import 'dart:async';

import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingViewModel extends AutoDisposeAsyncNotifier<EatGoUser?> {
  late final AuthRepository _authRepository;
  late final UserRepository _userRepository;

  @override
  FutureOr<EatGoUser?> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    _userRepository = ref.watch(userRepositoryProvider);
    return await getCurrentUser();
  }

  Future<EatGoUser?> getCurrentUser() async {
    state = const AsyncValue.loading();
    try {
      String? currentUserUid = _authRepository.getCurrentUserUid();
      if (currentUserUid != null) {
        Map<String, dynamic>? userMap =
        await _userRepository.getUser(currentUserUid);
        // Firestore에서 사용자 데이터를 가져오지 못한 경우
        if (userMap == null) {
          state = AsyncValue.error('사용자 데이터를 가져올 수 없습니다.', StackTrace.current);
          debugPrint('SettingViewModel 오류 발생 - userMap이 null로 반환되었습니다.');
          return null;
        }
        EatGoUser user = EatGoUser.fromJson(userMap);
        state = AsyncValue.data(user);
        return user;
      } else {
        state = AsyncValue.error('사용자 UID를 가져올 수 없습니다.', StackTrace.current);
        debugPrint('SettingViewModel 오류 발생 - getUser()값이 null로 반환');
        return null;
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      debugPrint('SettingViewModel 오류 발생 - $e');
    }
    return null;
  }

  // 사용자 계정 삭제 및 데이터 삭제
  Future<bool> deleteUserAccountAndData() async {
    state = const AsyncValue.loading();
    try {
      // 1. 현재 로그인된 사용자 UID 가져오기
      String? uid = _authRepository.getCurrentUserUid();
      if (uid == null) {
        state = const AsyncValue.data(null);
        return false;
      }
      // 2. 계정 삭제
      await _authRepository.deleteUserAccount();
      // 3. Firestore에서 사용자 데이터 삭제
      await _userRepository.deleteUserData(uid);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, stackTrace) {
      debugPrint('SettingViewModel 오류 발생 - 회원 탈퇴 중 오류: $e');
      state = AsyncValue.error(e, stackTrace);
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

  // 상태를 변경하되 Firestore에 즉시 저장하지 않음
  void togglePushNotification(bool isEnabled) {
    EatGoUser? user = state.value;
    if (user != null) {
      final updatedUser = user.copyWith(pushNotificationEnabled: isEnabled);
      state = AsyncValue.data(updatedUser);
    }
  }

  // 원래 상태로 복원하는 메서드 추가
  void resetToOriginal(EatGoUser? originalUser) {
    if (originalUser != null) {
      state = AsyncValue.data(originalUser);
    }
  }

  // 저장 버튼을 눌렀을 때만 Firestore에 저장
  Future<bool> saveSettings() async {
    state = const AsyncValue.loading();
    try {
      // 현재 상태의 사용자 정보를 Firestore에 업데이트
      final updatedUser = state.value;
      if (updatedUser == null) {
        debugPrint('SettingViewModel - 저장할 사용자 정보가 없습니다.');
        state = AsyncValue.error('저장할 사용자 정보가 없습니다.', StackTrace.current);
        return false;
      }
      await _userRepository.updateUserData(updatedUser: updatedUser);
      state = AsyncValue.data(updatedUser);
      debugPrint('사용자 정보가 성공적으로 업데이트되었습니다.');
      return true;
    } catch (e, stackTrace) {
      debugPrint('SettingViewModel 오류 발생 - 사용자 정보 저장 실패: $e');
      state = AsyncValue.error(e, stackTrace);
      return false;
    }
  }
}
