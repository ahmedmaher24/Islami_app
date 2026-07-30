import 'package:flutter/material.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/screens/intro_screens/widget_onboarding/custom_widget_onboarding.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_data.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});
  static const String routeName = "onboarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  final PageController myController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: myController,
              itemCount: OnboardingData.dataOnboarding.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return CustomWidgetOnboarding(
                  data: OnboardingData.dataOnboarding[index],
                  en: false,
                );
              },
            ),
          ),

          SmoothPageIndicator(
            controller: myController,
            count: OnboardingData.dataOnboarding.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColor.Gold_font,
              dotColor: Colors.grey,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 4,
              spacing: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: currentIndex > 0,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: TextButton(
                    onPressed: () {
                      myController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: AppColor.Gold_font,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Optional: Add Next/Finish button
                TextButton(
                  onPressed: () {
                    if (currentIndex <
                        OnboardingData.dataOnboarding.length - 1) {
                      myController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {}
                  },
                  child: Text(
                    currentIndex == OnboardingData.dataOnboarding.length - 1
                        ? "Finish"
                        : "Next",

                    style: TextStyle(
                      color: AppColor.Gold_font,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
