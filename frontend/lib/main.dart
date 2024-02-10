import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/presentation/home_page.dart';
import 'package:frontend/presentation/result_page.dart';
import 'package:frontend/presentation/splash_screen.dart';
import 'package:frontend/presentation/take_photo.dart';
import 'package:flutter/services.dart';

void main() {
  // runApp(MyApp());

  final MyApp myApp = MyApp();
  runApp(myApp);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: _bottomNavigationKey.currentState?.widget
      debugShowCheckedModeBanner: false,
      title: 'Injera mold',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        // '/': (context) => const MyHomePage(),
        '/take_photo': (context) => const TakePhoto(),
        '/result_page': (context) => const ResultPage(modifiedImageBase64: '')
      },
    );
  }
}
