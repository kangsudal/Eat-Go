import 'package:eat_go/screen/restaurant_screen/restaurant_screen_back_button.dart';
import 'package:eat_go/screen/restaurant_screen/keyword_suggestion_card.dart';
import 'package:eat_go/screen/restaurant_screen/scrollable_cards.dart';
import 'package:eat_go/viewmodels/restaurant_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantScreen extends StatefulWidget {
  final String recipeId;

  const RestaurantScreen({super.key, required this.recipeId});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isDialogOpen = false; // 다이얼로그 열려져있는지 체크
  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(45.521563, -122.677433),
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    int itemCount = 10;
    return Scaffold(
      // backgroundColor: Colors.greenAccent,

      extendBodyBehindAppBar: true,
      body: StreamBuilder(
        stream: locationServiceStatusStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            debugPrint('RestaurantScreen - ${snapshot.error}');
            return const Center(child: Text('오류가 발생했습니다.'));
          }

          bool? isLocationEnabled = snapshot.data;
          if (isLocationEnabled == true) {
            // 1. GPS 상태와 위치 권한이 모두 활성화된 경우
            // 1-1. 권한과 GPS가 활성화되었으므로 다이얼로그 닫기
            if (isDialogOpen) {
              Navigator.of(context).pop();
              isDialogOpen = false;
            }
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: initialPosition,
                ),
                KeywordSuggestionCard(),
                RestaurantScreenBackButton(),
                ScrollableCards(itemCount: itemCount),
              ],
            );
          } else {
            // 2. GPS 상태 또는 위치 권한이 비활성화된 경우
            if (!isDialogOpen) {
              isDialogOpen = true;
              Future.microtask(() => _showPermissionDialog(context));
            }
            return Container(); // GoogleMap을 사용할 수 없으면 비어있는 위젯 반환
          }
        },
      ),
    );
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("권한 설정 필요"),
          content: Text('GPS가 켜져있어야 하고, 위치 권한도 허용으로 바꿔주셔야해요'),
          actions: [
            TextButton(
              onPressed: () async {
                // 1. 현재 위치 권한 상태 확인
                LocationPermission permission =
                    await Geolocator.checkPermission();

                if (permission == LocationPermission.deniedForever) {
                  // 1-1. 영구적으로 거절 상태일 때 (거부 및 다시 묻지 않기), 설정 화면으로 이동하여 직접 허용하도록 유도
                  await Geolocator.openAppSettings();
                  return; // 이후 코드 실행 중지
                }

                if (permission == LocationPermission.denied) {
                  // 1-2. 앱을 처음 실행해서 권한이 아직 설정되지 않았거나, 설정 중 취소했을 경우, 또는 거부를 눌렀을 때
                  await Geolocator.requestPermission();
                }

                // 2. GPS 상태 확인 후 꺼져 있으면 설정 화면으로 이동
                bool isLocationEnabled =
                    await Geolocator.isLocationServiceEnabled();
                if (!isLocationEnabled) {
                  // GPS가 꺼져 있으면 위치 설정 화면으로 이동
                  await Geolocator.openLocationSettings();
                }
              },
              child: Text('권한 설정으로 이동'),
            ),
            TextButton(
              child: Text("닫기"),
              onPressed: () {
                // 다이얼로그를 닫고 이전 화면으로 이동
                isDialogOpen = false;
                context.pop(); // 다이얼로그 닫기
                context.pop(); // 지도 화면에서 이전 화면으로 이동
              },
            ),
          ],
        );
      },
    );
  }
}
