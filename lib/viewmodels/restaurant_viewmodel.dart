/*import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class RestaurantViewModel extends AsyncNotifier<List<Restaurant>> {
  @override
  Future<List<Restaurant>> build() async {
    // 앱이 시작될 때 자동으로 식당 데이터를 불러옴
    return await fetchRestaurantData();
  }

  Future<List<Restaurant>> fetchRestaurantData() async {
    state = const AsyncLoading(); // 로딩 상태 설정
    await Future.delayed(Duration(seconds: 2)); // 네트워크 지연 시뮬레이션
    return [
      Restaurant(name: 'Restaurant A', location: 'Location A'),
      Restaurant(name: 'Restaurant B', location: 'Location B'),
    ];
  }
}
*/

import 'dart:async';
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
