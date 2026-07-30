import 'package:flutter/material.dart';
import 'package:islamic/screens/layout/hadith/hadeth_details.dart';
import 'package:islamic/screens/layout/hadith/models/hadeth_data.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_color.dart';

class HadethCard extends StatelessWidget {
  HadethData hadethData;
  HadethCard({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routeName,
          arguments: hadethData,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: AppColor.Gold_font,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.SurahDetailsL,
                      color: theme.primaryColorDark,
                    ),
                    Spacer(),
                    Image.asset(AppAssets.SurahDetailsR, color: AppColor.black),
                  ],
                ),
              ),
              Column(
                children: [
                  Expanded(child: Image.asset(AppAssets.hadeth_bg_contant)),
                  Image.asset(AppAssets.hadethDetailbgD),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              hadethData.title,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.primaryColorDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Center(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        hadethData.body,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
