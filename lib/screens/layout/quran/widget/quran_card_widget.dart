import 'package:flutter/material.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_color.dart';
import '../models/sura_data.dart';
import '../quran_screen.dart';
import '../surah_details.dart';

class QuranCardWidget extends StatelessWidget {
  SuraContant suraContant;
  final void Function(int index) onTap;
  QuranCardWidget({required this.suraContant, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(suraContant.index);
        Navigator.pushNamed(
          context,
          SurahDetails.routeName,
          arguments: suraContant,
        );
      },
      child: Row(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.surahIcon),
              Text(
                "${suraContant.index + 1}",
                style: TextStyle(color: AppColor.surface, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraContant.nameEn,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.surface,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                "${suraContant.ayaVarses}Verses",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.surface,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            suraContant.nameAr,
            style: TextStyle(
              color: AppColor.surface,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
