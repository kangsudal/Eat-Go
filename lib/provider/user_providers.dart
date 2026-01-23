import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/current_eatgo_user_notifier.dart';
import 'package:eat_go/repository/user_repository.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firestore 인스턴스 Provider
final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

/// UserService Provider
final userServiceProvider = Provider<UserService>(
  (ref) => UserService(firestore: ref.watch(firestoreProvider)),
);

/// UserRepository Provider
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(userService: ref.watch(userServiceProvider)),
);

/// 현재 로그인한 사용자 정보 Provider
final currentEatGoUserProvider =
    AsyncNotifierProvider<CurrentEatGoUserNotifier, EatGoUser?>(
  CurrentEatGoUserNotifier.new,
);
