import 'package:flutter/material.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/core/theme/app_theme.dart';
import 'package:sizer/sizer.dart';

class SabhaScreen extends StatefulWidget {
  const SabhaScreen({super.key});

  @override
  State<SabhaScreen> createState() => _SabhaScreenState();
}

class _SabhaScreenState extends State<SabhaScreen> {
  @override
  List<String> tasbeehWorld = ["سبحان الله", "الحمدلله", "الله واكبر"];
  int counter = 0;
  int index = 0;
  double angelRotation = 0;
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sabhabg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SafeArea(child: Image.asset(AppAssets.homeLogo)),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            textAlign: TextAlign.center,
            style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          Center(
            child: Stack(
              children: [
                Positioned(
                  top: 6.h,
                  left: screenSize.width * 0.43,
                  child: Image.asset(AppAssets.sabhaHead),
                ),
                InkWell(
                  onTap: () {
                    cliclTasbeeh();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    height: 40.h,
                    child: AnimatedRotation(
                      turns: angelRotation / 360,
                      duration: Duration(milliseconds: 500),
                      child: Image.asset(AppAssets.sabhaBody),
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.29,
                  left: screenSize.width * 0.25,
                  child: Column(
                    children: [
                      Text(
                        tasbeehWorld[index],
                        textAlign: TextAlign.center,
                        style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
                          fontSize: 35,
                          color: AppColor.Gold_font,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      Text(
                        "$counter",
                        textAlign: TextAlign.center,
                        style: AppTheme.darkTheme.textTheme.bodyLarge?.copyWith(
                          fontSize: 40,
                          color: AppColor.Gold_font,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  cliclTasbeeh() {
    setState(() {
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbeehWorld.length;
      } else {
        counter++;
      }
      angelRotation += 15;
    });
  }
}
