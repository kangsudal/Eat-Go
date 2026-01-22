import 'package:eat_go/firebase_options.dart';
import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/provider/my_router_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final shakeNotifier = ref.read(shakeProvider.notifier);
    final myRouter = ref.read(myRouterProvider);

    // 현재 위치를 확인하는 부분
    final currentLocation = myRouter
        .routerDelegate.currentConfiguration.matches.last.matchedLocation;
/*
.first.matchedLocation:
matches 리스트의 첫 번째 요소의 matchedLocation을 가져옵니다.
첫 번째 요소는 일반적으로 가장 상위(루트)에 가까운 경로를 나타냅니다. 예를 들어, 중첩된 경로 구조에서 최상위 경로의 위치가 반환됩니다.
예를 들어 /home/detail 경로가 활성화된 경우, first.matchedLocation은 /home을 반환합니다.

.last.matchedLocation:
matches 리스트의 마지막 요소의 matchedLocation을 가져옵니다.
마지막 요소는 가장 구체적인(깊은) 경로를 나타냅니다. 즉, 중첩된 경로 구조에서 가장 하위에 있는 경로 위치가 반환됩니다.
같은 /home/detail 경로 예시에서, last.matchedLocation은 /home/detail을 반환합니다.
* */
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      shakeNotifier.disableShake(); // 앱이 백그라운드로 이동 시 흔들기 감지 비활성화
    } else if (state == AppLifecycleState.resumed &&
        currentLocation == '/home') {
      shakeNotifier.enableShake(); // 포그라운드 복귀 시 홈 화면에 있을 때만 흔들기 감지 활성화
    }
  }

  @override
  Widget build(BuildContext context) {
    final myRouter = ref.watch(myRouterProvider);
    return MaterialApp.router(
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
          backgroundColor: EatGoPalette.appBarColor,
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
      debugShowCheckedModeBanner: false,
    );
  }
}
