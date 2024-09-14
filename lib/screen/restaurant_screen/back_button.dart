import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class RestaurantBackButton extends StatelessWidget {
  const RestaurantBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: FloatingActionButton(
          heroTag: null,
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
    );
  }
}
