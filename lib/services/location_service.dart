import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
// 위치 권한 체크와 GPS 상태를 지속적으로 체크해주는 Stream
  static Stream<bool> locationServiceStatusStream({
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
}
