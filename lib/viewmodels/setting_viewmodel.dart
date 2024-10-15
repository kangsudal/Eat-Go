import 'dart:async';

import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/model/operation_result.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingViewModel extends AsyncNotifier<OperationResult<bool>> {
  late final UserRepository _userRepository;

  @override
  FutureOr<OperationResult<bool>> build() async {
    _userRepository = ref.watch(userRepositoryProvider);
    return OperationResult.success(false);
  }

  // 사용자 계정 삭제 및 데이터 삭제
  Future<void> deleteUserAccountAndData() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 전환

      // Service를 통해 계정 삭제 및 데이터 삭제 처리
      await _userRepository.deleteUserAccountAndInfo();

      state = AsyncValue.data(OperationResult<bool>.success(true)); // 성공 시 상태 업데이트
    } catch (e, stackTrace) {
      debugPrint('SettingViewModel 오류 발생 - 회원 탈퇴 중 오류: $e');
      state = AsyncValue.error(
          OperationResult<bool>.failure(e.toString()), stackTrace); // 에러 발생 시 상태 업데이트
    }
  }
}

