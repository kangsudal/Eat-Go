import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 10;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: 200,
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: FloatingActionButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment(0.4, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: pointColor,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: FloatingActionButton(
                    onPressed: () {},
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
                    itemBuilder: (BuildContext, index) => GestureDetector(
                      onTap: () {},
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
          ),
        ],
      ),
    );
  }
}
