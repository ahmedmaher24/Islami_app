import 'package:flutter/material.dart';
import 'package:islamic/screens/layout/adhan/adhan_screen.dart';
import 'package:islamic/screens/layout/hadith/hadeth_screen.dart';
import 'package:islamic/screens/layout/quran/quran_screen.dart';
import 'package:islamic/screens/layout/radio/radio_screen.dart';
import 'package:islamic/screens/layout/tasbeeh/sabha_screen.dart';

import '../../core/constant/app_assets.dart';
import '../../core/theme/app_color.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";
  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SabhaScreen(),
    RadioScreen(),
    AdhanScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.Gold_font,
        fixedColor: AppColor.Gold_font,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: AppColor.onPrimary),
        selectedLabelStyle: TextStyle(color: AppColor.onPrimary),
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? AppColor.black.withOpacity(0.6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ImageIcon(AssetImage(AppAssets.quranIcon)),
            ),
            label: "quran",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? AppColor.black.withOpacity(0.6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ImageIcon(AssetImage(AppAssets.hadithIcon)),
            ),
            label: "hadith",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                color: selectedIndex == 2
                    ? AppColor.black.withOpacity(0.6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ImageIcon(AssetImage(AppAssets.saphaIcon)),
            ),
            label: "sapha",
          ),
          //how used to ActiveIcon instead of container in icon
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                color: selectedIndex == 3
                    ? AppColor.black.withOpacity(0.6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ImageIcon(AssetImage(AppAssets.radioIcon)),
            ),
            label: "radio",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                color: selectedIndex == 4
                    ? AppColor.black.withOpacity(0.6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ImageIcon(AssetImage(AppAssets.adhanIconn)),
            ),
            label: "adhan",
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex, // سيظهر الشاشة المختارة فقط
        children: screens, // سيحتفظ بكل الشاشات (Quran, Hadeth, etc) في الذاكرة
      ),
    );
  }
}
