import 'package:eat_go/my_routes.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/viewmodels/recipe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeViewModel()),
      ],
      child: MaterialApp.router(
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
          ),
          appBarTheme: AppBarTheme(
            color: EatGoPalette.appBarColor,
            elevation: 0,
            titleTextStyle: GoogleFonts.poppins(
              color: EatGoPalette.mainTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          scaffoldBackgroundColor: EatGoPalette.backgroundColor1,
        ),
        routerConfig: myRouter,
      ),
    );
  }
}
