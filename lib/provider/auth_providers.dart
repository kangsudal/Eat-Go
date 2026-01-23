import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/repository/auth_repository.dart';
import 'package:eat_go/services/auth_service.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:eat_go/viewmodels/setting_viewmodel.dart';
import 'package:eat_go/viewmodels/sign_in_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firebase Auth 인스턴스 Provider
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

/// Firebase Auth 로그인 상태를 추적하는 StreamProvider
final authStateProvider = StreamProvider<User?>((ref) async* {
  final auth = ref.read(authProvider);
  try {
    // User 정보 강제로 새로고침 (콘솔에서 강제삭제한 경우 남아있기 때문)
    if (auth.currentUser != null) {
      await auth.currentUser?.reload();
    }
  } catch (e) {
    logger.e('User 정보 reload 하는데 에러 발생', error: e);
  }
  yield* auth.authStateChanges().handleError((error) {
    logger.e('Error in authStateChanges', error: error);
  });
});

/// AuthService Provider (인증 관련 서비스 제공)
final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(auth: ref.watch(authProvider)),
);

/// AuthRepository Provider
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(authService: ref.watch(authServiceProvider)),
);

/// SignInViewModel Provider
final signInViewModelProvider = AsyncNotifierProvider<SignInViewModel, void>(
  SignInViewModel.new,
);

/// SettingViewModel Provider (탈퇴 관련)
final settingViewModelProvider =
    AsyncNotifierProvider.autoDispose<SettingViewModel, EatGoUser?>(
  SettingViewModel.new,
);
