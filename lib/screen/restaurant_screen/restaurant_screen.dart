import 'dart:async';

import 'package:eat_go/model/author_attribution_model.dart';
import 'package:eat_go/model/photo_model.dart';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/screen/restaurant_screen/restaurant_screen_back_button.dart';
import 'package:eat_go/screen/restaurant_screen/keyword_suggestion_card.dart';
import 'package:eat_go/screen/restaurant_screen/scrollable_cards.dart';
import 'package:eat_go/viewmodels/restaurant_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  final String recipeTitle;

  const RestaurantScreen({super.key, required this.recipeTitle});

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  bool isDialogOpen = false; // 다이얼로그 열려져있는지 체크
  final Completer<GoogleMapController> googleMapControllerCompleter =
      Completer();
  Set<Marker> markers = {}; // 마커를 저장할 Set
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  TextEditingController textEditingController = TextEditingController();

  void fetchMarkers(List<Restaurant> restaurants) async {
    markers = restaurants.map((restaurant) {
      return Marker(
        markerId: MarkerId(restaurant.id),
        position: restaurant.location,
        infoWindow: InfoWindow(
          title: restaurant.displayName,
          snippet: restaurant.formattedAddress,
          onTap: () {
            openExternalBrowser(restaurant.googleMapsUri);
            // if (restaurant.photos != null) {
            //   Photo lastPhoto =
            //       restaurant.photos![restaurant.photos!.length - 1];
            //   debugPrint('lastPhoto.googleMapsUri:${lastPhoto.googleMapsUri}');
            //   debugPrint('lastPhoto.name:${lastPhoto.name}');
            //   debugPrint(
            //       'lastPhoto.flagContentUri:${lastPhoto.flagContentUri}');
            //   if (lastPhoto.authorAttributions.isNotEmpty) {
            //     int length = lastPhoto.authorAttributions.length;
            //     AuthorAttribution lastAuthorAttribution =
            //         lastPhoto.authorAttributions[length - 1];
            //     debugPrint(
            //         'lastAuthorAttribution.displayName:${lastAuthorAttribution.displayName}');
            //     debugPrint(
            //         'lastAuthorAttribution.uri:${lastAuthorAttribution.uri}');
            //     debugPrint(
            //         'lastAuthorAttribution.photoUri:${lastAuthorAttribution.photoUri}');
            //   }
            // }
          },
        ),
        icon: customIcon,
      );
    }).toSet();
    debugPrint('${restaurants.length}개의 마커 패치 완료');
  }

  Future<void> createCustomMapIcon() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(35, 52)),
      'assets/icons/map-marker-clover-white.png',
    );
  }

  @override
  void initState() {
    createCustomMapIcon();
    super.initState();
  }

  @override
  void dispose() {
    //GoogleMapController와 같은 컨트롤러를 사용할 때는 중복 생성되지 않도록 처리
    googleMapControllerCompleter.future
        .then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationServiceStatus = ref.watch(locationServiceStatusProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: locationServiceStatus.when(
        data: (isPermissionGrantedAndGPSEnabled) {
          if (isPermissionGrantedAndGPSEnabled == true) {
            // 1. GPS 상태와 위치 권한이 모두 활성화된 경우
            // 1-1. 권한과 GPS가 활성화되었으므로 다이얼로그 닫기
            closeDialogIfOpen();
            final restaurantViewModelState =
                ref.watch(restaurantViewModelProvider(widget.recipeTitle));

            return restaurantViewModelState.when(data: (restaurants) {
              if (restaurants.isEmpty) {
                return Scaffold(
                  appBar: AppBar(),
                  body: Align(
                    alignment: const Alignment(0, -0.3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/memo-no-result.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 10),
                        const Text('관련된 식당이 없습니다!'),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: Text('검색어 수정'),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      24.0, 12.0, 24.0, 16.0),
                                  children: [
                                    TextField(
                                      controller: textEditingController,
                                      decoration: InputDecoration(
                                        hintText: widget.recipeTitle,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: Text(
                                            '취소',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.go(
                                                '/home/restaurant/${textEditingController.text}');
                                            context.pop();
                                          },
                                          child: Text('재탐색'),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('검색어 직접 수정하여 재탐색'),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return buildGoogleMap(restaurants);
              }
            }, error: (error, stackTrace) {
              debugPrint(
                  'RestaurantScreen - RestaurantViewModelState의 data를 불러오지 못했습니다.$error');
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Text('레스토랑 리스트 정보을를 불러오지 못했습니다.'),
                ),
              );
            }, loading: () {
              debugPrint('currentPositionState를 가지고오고있는 중입니다.');
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
          } else {
            // 2. GPS 상태 또는 위치 권한이 비활성화된 경우
            if (!isDialogOpen) {
              isDialogOpen = true;
              Future.microtask(() => _showPermissionDialog(context));
            }
            return Container(); // GoogleMap을 사용할 수 없으면 비어있는 위젯 반환
          }
        },
        error: (error, stackTrace) {
          debugPrint('RestaurantScreen - $error');
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('오류가 발생했습니다.'),
            ),
          );
        },
        loading: () {
          debugPrint('locationServiceStatus를 불러오고있습니다.');
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildGoogleMap(List<Restaurant> restaurants) {
    fetchMarkers(restaurants);
    CameraPosition initialPosition = CameraPosition(
      target: LatLng(
        restaurants[0].location.latitude,
        restaurants[0].location.longitude,
      ),
      zoom: 12,
    );
    return Stack(
      children: [
        GoogleMap(
          key: const ValueKey('unique_google_map'), //맵 중복생성 안되게
          initialCameraPosition: initialPosition,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            if (!googleMapControllerCompleter.isCompleted) {
              googleMapControllerCompleter.complete(controller); //Completer 완료
            }
          },
          markers: markers,
        ),
        // KeywordSuggestionCard(),
        RestaurantScreenBackButton(),
        ScrollableCards(
          itemCount: restaurants.length,
          googleMapControllerFuture: googleMapControllerCompleter.future,
          restaurantList: restaurants,
        ),
      ],
    );
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("권한 설정 필요"),
          content: const Text(
              '사용자 위치를 기준으로  주변 식당을 추천하기위해 GPS가 켜져있어야 하고, 위치 권한도 허용으로 바꿔주셔야해요'),
          actions: [
            TextButton(
              onPressed: () {
                closeDialogIfOpen();
                context.pop();
              },
              child: const Text(
                '닫기',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: checkAndRequestPermissions,
              child: const Text('계속'),
            ),
          ],
        );
      },
    );
  }

  Future<void> checkAndRequestPermissions() async {
    // 권한 상태를 확인하고 필요한 경우 요청

    // 1. 현재 위치 권한 상태 확인
    LocationPermission permission = await Geolocator.checkPermission();

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
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      // GPS가 꺼져 있으면 위치 설정 화면으로 이동
      await Geolocator.openLocationSettings();
    }
  }

  void closeDialogIfOpen() {
    // 다이얼로그가 열려 있으면 닫고 상태 초기화
    if (isDialogOpen) {
      context.pop();
      isDialogOpen = false;
    }
  }

  void openExternalBrowser(String googleMapsUri) async {
    final url = Uri.parse(googleMapsUri);
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication); //외부 브라우저로 열기
    }
  }
}
