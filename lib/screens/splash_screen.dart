import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const OnBoardingPage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFBDA12),
                  Color(0xFF161421),
                ]),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/_splash_1.png",
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                     decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/splash_1.png",), fit: BoxFit.cover)),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
