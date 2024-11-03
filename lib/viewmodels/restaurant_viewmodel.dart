import 'dart:async';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

// 위치 권한 체크와 GPS 상태를 지속적으로 체크해주는 Stream
Stream<bool> locationServiceStatusStream({
  Duration interval = const Duration(seconds: 5),
}) async* {
  bool? lastStatus; //마지막 상태를 저장하여 변경 시에만 업데이트
  while (true) {
    // GPS 활성화 여부 확인
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    // 위치 권한 상태 확인
    LocationPermission permission = await Geolocator.checkPermission();
    bool isPermissionGranted = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;

    bool currentStatus = isLocationEnabled &&
        isPermissionGranted; // 권한과 GPS 상태가 모두 true일 때만 true를 반환하며, 하나라도 false라면 false

    //상태가 변경된 경우만 업데이트
    if (lastStatus == null || currentStatus != lastStatus) {
      lastStatus = currentStatus;
      yield currentStatus;
    }
    await Future.delayed(interval);
  }
}

class RestaurantViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<Restaurant>, String> {
  late final RestaurantRepository _restaurantRepository;
  late String keyword;

  @override
  FutureOr<List<Restaurant>> build(String arg) {
    _restaurantRepository = ref.read(restaurantRepositoryProvider);
    keyword = arg;
    return fetchRestaurantByTextSearch();
  }

  Future<List<Restaurant>> fetchRestaurantByTextSearch() async {
    // API 호출 후 Restaurant 데이터 가져옴
    return _restaurantRepository.fetchRestaurantByTextSearch(keyword);
  }
}
