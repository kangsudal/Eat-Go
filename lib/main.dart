import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/home_screen.dart';
import 'package:eat_go/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: pointColor,
        useMaterial3: false,
        fontFamily: 'Pretendard',
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
            //sign in에 사용
            color: pointColor,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            //AppBar의 title에 사용
            color: EatGoPalette.mainTextColor,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: EatGoPalette.appBarColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: EatGoPalette.backgroundColor1,
      ),
      home: const HomeScreen(), //const SignInScreen(),
    );
  }
}
