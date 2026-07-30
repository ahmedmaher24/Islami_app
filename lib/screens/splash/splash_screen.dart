import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamic/screens/intro_screens/onborading.dart';
import 'package:islamic/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background (3).png",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Positioned(
            top: 50,
            left: 60,
            child: BounceInUp(
              child: Image.asset("assets/logo/Mosque-01 1.png"),
            ),
          ),
          Positioned(
            right: 3,
            child: BounceInUp(child: Image.asset("assets/logo/Glow.png")),
          ),
          Positioned(
            left: 3,
            top: 200,
            child: BounceInLeft(
              child: Image.asset("assets/logo/splash_screen_flower_left.png"),
            ),
          ),
          Positioned(
            left: 110,
            top: 340,
            child: BounceInUp(
              child: Image.asset("assets/logo/logo_islami.png"),
            ),
          ),
          Positioned(
            left: 110,
            top: 500,
            child: BounceInDown(child: Image.asset("assets/logo/Islami.png")),
          ),
          Positioned(
            right: 3,
            top: 620,
            child: BounceInRight(
              child: Image.asset("assets/logo/splash_screen_flower_right.png"),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
