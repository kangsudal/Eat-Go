import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScrollableCards extends StatelessWidget {
  const ScrollableCards({
    super.key,
    required this.itemCount,
    required this.googleMapControllerFuture,
  });

  final int itemCount;
  final Future<GoogleMapController> googleMapControllerFuture;

  void animateToMyLocation() async {
    final location = await Geolocator.getCurrentPosition();
    debugPrint('lat:${location.latitude}, long:${location.longitude}');
    final GoogleMapController googleMapController = await googleMapControllerFuture;
    googleMapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          location.latitude,
          location.longitude,
        ),
      ),
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () {
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
                },
                child: Container(
                  margin: index == itemCount - 1
                      ? EdgeInsets.only(left: 20, right: 20, bottom: 30)
                      : EdgeInsets.only(left: 20, bottom: 30),
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20.0,
                        spreadRadius: -10.0,
                        offset: const Offset(8, 10),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
