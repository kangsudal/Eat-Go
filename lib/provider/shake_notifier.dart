import 'dart:async';
import 'dart:math';

import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';

class ShakeNotifier extends Notifier<bool> {
  StreamSubscription? _accelerometerSubscription;

  @override
  bool build() {
    enableShake();
    return true;
  }

  // 흔들림 활성화/비활성화 토글
  void toggleShake() {
    state = !state;
    if (state) {
      enableShake();
    } else {
      disableShake();
    }
  }

  void enableShake() {
    state = true;
    const double shakeThreshold =
        17.0; // 흔들림 감지 임계값( 숫자가 올라갈수록 더 세게 흔들어야한다. 15는너무낮고 20은 너무세다)
    _accelerometerSubscription =
        accelerometerEventStream().listen((event) async {
      final double gX = event.x;
      final double gY = event.y;
      final double gZ = event.z;

      // 가속도 벡터 크기 계산
      final double acceleration = sqrt(gX * gX + gY * gY + gZ * gZ);

      if (acceleration > shakeThreshold && state) {
        // 흔들림 발생 시 진동 실행
        if (await Vibration.hasVibrator()) {
          await Vibration.vibrate();
        }

        // 흔들림 발생 시 레시피 불러오기 메서드 실행
        final selectedCategories = ref.watch(homeScreenCategoriesProvider);
        final keywords = ref.watch(homeScreenKeywordsProvider);
        await ref
            .read(homeViewModelProvider.notifier)
            .fetchRandomRecipeWithRetry(
              categories: selectedCategories,
              keywords: keywords,
            );
      }
    });
  }

  // 흔들림 기능 비활성화
  void disableShake() {
    state = false;
    _accelerometerSubscription?.cancel(); // 구독을 완전히 종료
    _accelerometerSubscription = null; // 구독 변수를 null로 초기화
  }
}
