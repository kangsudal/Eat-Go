import 'dart:async';
import 'dart:math';

import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeNotifier extends Notifier<bool> {
  StreamSubscription? _accelerometerSubscription;

  @override
  bool build() {
    //처음에 흔들기 활성화 상태로 시작
    initShakeListener(onShake: () {
      ref.read(homeViewModelProvider.notifier).fetchRandomRecipeWithRetry();
    });
    return true;
  }

  void initShakeListener({required Function onShake}) {
    const double shakeThreshold = 17.0; // 흔들림 감지 임계값( 숫자가 올라갈수록 더 세게 흔들어야한다. 15는너무낮고 20은 너무세다)
    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      double gX = event.x;
      double gY = event.y;
      double gZ = event.z;

      // 가속도 벡터 크기 계산
      double acceleration = sqrt(gX * gX + gY * gY + gZ * gZ);

      if (acceleration > shakeThreshold && state) {
        // 흔들림 발생 시 레시피 불러오기 메서드 실행
        onShake();
      }
    });
  }
  // 흔들림 활성화/비활성화 토글
  void toggleShake() {
    state = !state;
    if (state) {
      initShakeListener(onShake: () {
        ref.read(homeViewModelProvider.notifier).fetchRandomRecipeWithRetry();
      });
    } else {
      stopListening();
    }
  }

  // 흔들림 감지 중지
  void stopListening() {
    _accelerometerSubscription?.cancel();
  }

  // 흔들림 기능 비활성화
  void disableShake() {
    state = false;
    stopListening();
  }
}
