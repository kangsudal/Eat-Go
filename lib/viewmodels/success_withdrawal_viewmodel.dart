import 'dart:async';

import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/model/operation_result.dart';
import 'package:eat_go/repository//user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuccessWithdrawalViewModel extends AsyncNotifier<OperationResult<bool>> {
  late final UserRepository _userService;

  @override
  FutureOr<OperationResult<bool>> build() async {
    _userService = ref.watch(userServiceProvider);
    return OperationResult.success(false);
  }
  // 상태 초기화 메서드
  void resetState() {
    state = AsyncValue.data(OperationResult.success(false)); // 초기 상태로 복원
  }
}