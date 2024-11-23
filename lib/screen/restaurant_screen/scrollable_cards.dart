import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ScrollableCards extends StatelessWidget {
  ScrollableCards({
    super.key,
    required this.itemCount,
    required this.googleMapControllerFuture,
    required this.restaurantList,
  });

  final int itemCount;
  final Future<GoogleMapController> googleMapControllerFuture;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.7);
  final List<Restaurant> restaurantList;

  void animateToMyLocation() async {
    final location = await Geolocator.getCurrentPosition();
    // debugPrint('lat:${location.latitude}, long:${location.longitude}');
    final GoogleMapController googleMapController =
        await googleMapControllerFuture;
    googleMapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          location.latitude,
          location.longitude,
        ),
      ),
    );
  }

  void animateToRestaurant(LatLng restaurantLocation) async {
    final GoogleMapController googleMapController =
        await googleMapControllerFuture;
    // 지도 카메라를 해당 좌표로 이동
    googleMapController.animateCamera(
      CameraUpdate.newLatLng(restaurantLocation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: animateToMyLocation,
              child: Icon(
                Icons.gps_fixed,
                color: pointColor,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 120, //card사이즈의 height값이 여기에 맞춰진다.
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (int i) {
                LatLng restaurantLocation = LatLng(
                  restaurantList[i].location.latitude,
                  restaurantList[i].location.longitude,
                );
                animateToRestaurant(restaurantLocation);
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                Restaurant restaurant = restaurantList[index];
                return GestureDetector(
                  /*onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Dialog(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              final dialogWidth = constraints.maxWidth;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                height: 500,
                                // width: 100,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 180, //사진 슬라이드 높이
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Container(
                                            // height: 10,
                                            width: dialogWidth,
                                            decoration: BoxDecoration(
                                              color: Colors.primaries[index],
                                            ),
                                          );
                                        },
                                        itemCount: Colors.primaries.length,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.clear,
                              color: pointColor,
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      );
                    },
                  );
                },*/
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 30),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 20.0,
                          spreadRadius: -10.0,
                          offset: const Offset(8, 10),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.displayName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  if (restaurant.rating != null)
                                    Row(
                                      children: [
                                        Text('${restaurant.rating}'),
                                        for (int i = 0;
                                            i < restaurant.rating!.floor();
                                            i++)
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        // 소수 부분(반 별)
                                        if (restaurant.rating! -
                                                restaurant.rating!.floor() >=
                                            0.5)
                                          Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                          ),
                                        // 빈 별
                                        for (int i = 0;
                                            i <
                                                (5 -
                                                    restaurant.rating!
                                                        .ceil()); // 총 별의 갯수(5개)에서 표시된 별의 갯수 빼기
                                            i++)
                                          Icon(
                                            Icons.star_border,
                                            color: Colors.grey,
                                          ),
                                      ],
                                    ),
                                  Expanded(
                                    child: FittedBox(
                                      fit:BoxFit.scaleDown,
                                        child: Text(
                                            '${restaurant.formattedAddress}')),
                                  ),
                                  // Text('${restaurant.businessStatus}'),
                                ],
                              ),
                            ),
                            if (restaurant.photos != null)
                              if (restaurant.photos!.isNotEmpty)
                                Image.network(
                                    'https://places.googleapis.com/v1/${restaurant.photos![0].name}/media?key=${dotenv.env['GOOGLE_MAPS_API_KEY']}&max_width_px=100'),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFFDCEADF),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              '${index + 1}/${restaurantList.length}',
                              style: TextStyle(color: Color(0xFF1B7338)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
