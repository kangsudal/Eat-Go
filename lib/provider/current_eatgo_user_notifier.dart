import 'dart:async';

import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/auth_providers.dart';
import 'package:eat_go/provider/user_providers.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentEatGoUserNotifier extends AsyncNotifier<EatGoUser?> {
  // Late 초기화 대신 getter 사용으로 안전성 향상
  AuthRepository get _authRepository => ref.watch(authRepositoryProvider);
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);

  @override
  FutureOr<EatGoUser?> build() async {
    return await getCurrentUser();
  }

  Future<EatGoUser?> getCurrentUser() async {
    state = const AsyncValue.loading();
    try {
      final String? currentUserUid = _authRepository.getCurrentUserUid();
      if (currentUserUid != null) {
        final Map<String, dynamic>? userMap =
            await _userRepository.getUser(currentUserUid);
        // Firestore에서 사용자 데이터를 가져오지 못한 경우
        if (userMap == null) {
          state = const AsyncValue.data(null);
          logger.w('CurrentEatGoUserNotifier - userMap이 null로 반환되었습니다.');
          return null;
        }
        final EatGoUser user = EatGoUser.fromJson(userMap);
        state = AsyncValue.data(user);
        return user;
      } else {
        state = const AsyncValue.data(null);
        logger.w('CurrentEatGoUserNotifier - getCurrentUserUid()값이 null로 반환');
        return null;
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      logger.e('CurrentEatGoUserNotifier 오류 발생', error: e);
    }
    return null;
  }

  /// 사용자 정보를 업데이트합니다 (네트워크 호출 없이 로컬 상태만 업데이트)
  void updateUser(EatGoUser user) {
    state = AsyncValue.data(user);
  }

  /// 서버에서 사용자 정보를 새로고침합니다
  Future<void> refreshUser() async {
    await getCurrentUser();
  }
}
