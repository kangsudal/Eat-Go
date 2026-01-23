/// Eat-Go 앱의 모든 Provider를 re-export하는 라이브러리
///
/// 이 파일은 하위 호환성을 위해 유지됩니다.
/// 새 코드에서는 각 도메인별 Provider 파일을 직접 import하는 것을 권장합니다:
/// - auth_providers.dart: 인증 관련
/// - user_providers.dart: 사용자 관련
/// - recipe_providers.dart: 레시피 관련
/// - bookmark_providers.dart: 북마크 관련
/// - location_providers.dart: 위치/식당 관련
library;

// 인증 관련 Providers
export 'package:eat_go/provider/auth_providers.dart';
// 북마크 관련 Providers
export 'package:eat_go/provider/bookmark_providers.dart';
// 위치/식당 관련 Providers
export 'package:eat_go/provider/location_providers.dart';
// 레시피 관련 Providers
export 'package:eat_go/provider/recipe_providers.dart';
// 사용자 관련 Providers (Firestore 포함)
export 'package:eat_go/provider/user_providers.dart';
