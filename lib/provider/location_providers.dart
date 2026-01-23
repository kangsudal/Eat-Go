import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/provider/shake_notifier.dart';
import 'package:eat_go/repository/restaurant_repository.dart';
import 'package:eat_go/services/location_service.dart';
import 'package:eat_go/services/restaurant_service.dart';
import 'package:eat_go/viewmodels/restaurant_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 위치 권한 및 GPS 상태 모니터링 Provider
final locationServiceStatusProvider = StreamProvider.autoDispose<bool>((ref) {
  return LocationService.locationServiceStatusStream();
});

/// RestaurantRepository Provider
final restaurantRepositoryProvider = Provider(
  (ref) => RestaurantRepository(
    restaurantService: RestaurantService(),
  ),
);

/// 식당 검색 ViewModel Provider (family 패턴)
final restaurantViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<RestaurantViewModel, List<Restaurant>, String>(
  RestaurantViewModel.new,
);

/// 흔들기 감지 Provider
final shakeProvider = NotifierProvider<ShakeNotifier, bool>(ShakeNotifier.new);
