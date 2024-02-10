import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/presentation/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Color(0xFF907F7F)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Center(
          child: AnimatedRotation(
            turns: 0.0,
            duration: Duration(seconds: 10),
            child: Image(
              image: AssetImage(
                'images/1024.png',
              ),
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
