import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shake/shake.dart';

class ShakeNotifier extends Notifier<bool> {
  ShakeDetector? _shakeDetector;

  @override
  bool build() {
    //처음에 흔들기 활성화 상태로 시작
    initShakeListener(onShake: () {
      ref.read(homeViewModelProvider.notifier).fetchRandomRecipeWithRetry();
    });
    return true;
  }

  void initShakeListener({required Function onShake}) {
    _shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      if (state) {
        //흔들림 발생시 레시피 불러오기 메서드를 실행
        onShake(); //fetchRandomRecipeWithRetry가 실행됨
      }
    });
  }
  // 흔들림 활성화/비활성화 토글
  void toggleShake() {
    state = !state;
    if (state) {
      _shakeDetector?.startListening();
    } else {
      _shakeDetector?.stopListening();
    }
  }

  // 흔들림 기능 비활성화
  void disableShake() {
    state = false;
    _shakeDetector?.stopListening();
  }
}
