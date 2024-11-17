import 'dart:async';

import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentEatGoUserNotifier extends AsyncNotifier<EatGoUser?> {
  late AuthRepository _authRepository;
  late UserRepository _userRepository;

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
          debugPrint('CurrentEatGoUserNotifier 오류 발생 - userMap이 null로 반환되었습니다.');
          return null;
        }
        EatGoUser user = EatGoUser.fromJson(userMap);
        state = AsyncValue.data(user);
        return user;
      } else {
        state = AsyncValue.error('사용자 UID를 가져올 수 없습니다.', StackTrace.current);
        debugPrint('CurrentEatGoUserNotifier - getCurrentUserUid()값이 null로 반환');
        return null;
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      debugPrint('CurrentEatGoUserNotifier 오류 발생 - $e');
    }
    return null;
  }
}
