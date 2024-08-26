import 'package:flutter/material.dart';
import 'dart:ui';

// const mainAccentColor = Color(0xff6446ff);
// const paleAccentColor = Color(0xffBFC6FA);
// const subAccentColor = Color(0xff5293FF);
// const red900 = Color(0xffFF402F);
// const red600 = Color(0xffFF6450);
// const gray900 = Color(0xff1B1D1F);
// const gray600 = Color(0xff454C53);
// const gray400 = Color(0xff878EA1);
// const gray200 = Color(0xffC9CDD2);
// const gray100 = Color(0xffE8EBED);
// const background = Color(0xffEDF3FB);
class EatGoPalette {
  // static Color pointColor = const Color(0xFF3CB371);
  static Color backgroundColor1 = const Color(0xFFFFFFFF);
  static Color mainTextColor = Colors.black;
  static Color subTextColor = const Color(0xFFAEAEAE);
  static Color appBarColor = Colors.white;
  static Color cardColor1 = Colors.white;
  static Color lineColor = const Color(0xFFD9D9D9);
}

const MaterialColor pointColor = MaterialColor(
  0xFF3CB371,
  <int, Color>{
    50: Color(0xFF3CB371),
    100: Color(0xFF3CB371),
    200: Color(0xFF3CB371),
    300: Color(0xFF3CB371),
    400: Color(0xFF3CB371),
    500: Color(0xFF3CB371),
    600: Color(0xFF3CB371),
    700: Color(0xFF3CB371),
    800: Color(0xFF3CB371),
    900: Color(0xFF3CB371),
  },
);

//그래프 칼라
class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}
