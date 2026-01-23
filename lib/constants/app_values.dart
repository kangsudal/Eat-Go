/// 앱 전체에서 사용되는 값 상수
class AppValues {
  AppValues._();

  // 흔들기 감지 관련
  static const double shakeThreshold = 17.0;
  static const int shakeDebounceMs = 500;

  // 검색 관련
  static const double searchRadiusMeters = 50000.0;
  static const int searchResultLimit = 20;

  // 재시도 관련
  static const int maxRetryCount = 5;
  static const int retryDelayMs = 1000;

  // 레시피 관련
  static const int randomRecipeLimit = 7;
  static const int recentRecipeLimit = 10;

  // 캐시 관련
  static const int cacheDurationMinutes = 5;
  static const int maxCacheSize = 100;

  // 페이지네이션 관련
  static const int pageSize = 20;

  // 애니메이션 관련
  static const int animationDurationMs = 300;
  static const int splashDurationMs = 2000;
}
