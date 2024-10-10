import 'package:eat_go/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends StateNotifier<AsyncValue<void>> {
  final UserService _userService;

  UserViewModel(this._userService) : super(const AsyncValue.data(null));

  // 사용자 계정 삭제 및 데이터 삭제
  Future<void> deleteUserAccountAndData() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 전환

      // Service를 통해 계정 삭제 및 데이터 삭제 처리
      await _userService.deleteUserAccountAndInfo();

      state = const AsyncValue.data(null); // 성공 시 상태 업데이트
    } catch (e, stackTrace) {
      state = AsyncValue.error(
          '회원 탈퇴 처리 중 오류 발생: $e', stackTrace); // 에러 발생 시 상태 업데이트
    }
  }
}
