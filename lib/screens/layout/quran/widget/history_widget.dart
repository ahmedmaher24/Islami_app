import 'package:flutter/material.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/screens/layout/quran/models/sura_data.dart';

import '../../../../core/theme/app_color.dart';
import '../surah_details.dart';

class HistoryWidget extends StatelessWidget {
  SuraContant suraContant;

  HistoryWidget({super.key, required this.suraContant});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SurahDetails.routeName,
          arguments: suraContant,
        );
      },
      child: Container(
        width: 250, // أعطيناه عرض محدد ليظهر في القائمة الأفقية
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColor.Gold_font,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      suraContant.nameEn,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      suraContant.nameAr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${suraContant.ayaVarses} Verses",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppAssets.surahSearch, width: 80),
            ),
          ],
        ),
      ),
    );
  }
}
