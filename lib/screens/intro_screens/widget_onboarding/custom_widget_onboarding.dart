import 'package:flutter/material.dart';
import 'package:islamic/screens/intro_screens/onboarding_data.dart';

import '../../../core/theme/app_color.dart';

class CustomWidgetOnboarding extends StatelessWidget {
  final OnboardingData data;
  bool en = true;
  CustomWidgetOnboarding({super.key, required this.data, required this.en});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 60,
                child: Image.asset("assets/logo/Mosque-01 1.png"),
              ),
              Positioned(
                top: 120,
                left: 125,
                child: Image.asset("assets/logo/Islami.png"),
              ),
            ],
          ),
        ),
        SizedBox(height: 60),
        Image.asset(data.image),
        SizedBox(height: 20),
        Center(
          child: Text(
            en ? data.titleEn : data.titleAr,
            style: TextStyle(
              fontFamily: "Janna Lt",
              color: AppColor.Gold_font,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: 7),
        Center(
          child: Text(
            en ? data.subTitleEn : data.subTitleAr,
            style: TextStyle(
              fontFamily: "Janna Lt",
              color: AppColor.Gold_font,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
