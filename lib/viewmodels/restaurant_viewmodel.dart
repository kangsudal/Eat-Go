import 'dart:async';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

// 위치 권한 체크와 GPS 상태를 지속적으로 체크해주는 Stream
Stream<bool> locationServiceStatusStream({
  Duration interval = const Duration(seconds: 5),
}) async* {
  await for (var _ in Stream.periodic(interval)) {
    // GPS 활성화 여부 확인
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    // 위치 권한 상태 확인
    LocationPermission permission = await Geolocator.checkPermission();
    bool isPermissionGranted = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;

    // 권한과 GPS 상태가 모두 true일 때만 true를 반환하며, 하나라도 false라면 false를 반환
    yield isLocationEnabled && isPermissionGranted;
  }
}

class RestaurantViewModel extends AsyncNotifier<List<Restaurant>> {
  @override
  FutureOr<List<Restaurant>> build() {
    return fetchRestaurants();
  }

  Future<List<Restaurant>> fetchRestaurants() async {
    // API 호출 후 Restaurant 데이터 가져옴
    return [];
  }
}
