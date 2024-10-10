import 'package:eat_go/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends StateNotifier<AsyncValue<Result<bool>>> {
  final UserService _userService;

  UserViewModel(this._userService)
      : super(AsyncValue.data(Result.success(false)));

  // 사용자 계정 삭제 및 데이터 삭제
  Future<void> deleteUserAccountAndData() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 전환

      // Service를 통해 계정 삭제 및 데이터 삭제 처리
      await _userService.deleteUserAccountAndInfo();

      state = AsyncValue.data(Result.success(true)); // 성공 시 상태 업데이트
    } catch (e, stackTrace) {
      state = AsyncValue.error(
          Result.failure('회원 탈퇴 처리 중 오류 발생'), stackTrace); // 에러 발생 시 상태 업데이트
      debugPrint('회원 탈퇴 처리 중 오류 발생: $e');
    }
  }

  // 상태 초기화 메서드
  void resetState() {
    state = AsyncValue.data(Result.success(false)); // 초기 상태로 복원
  }
}

//성공, 실패, 에러 메시지, 추가 데이터 등을 담음
class Result<T> {
  final T? data;
  final String? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;
}
