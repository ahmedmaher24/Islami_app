import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/screens/layout/hadith/models/hadeth_data.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadethDetails";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as HadethData;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColor.backgroundQuranDetails,
      appBar: AppBar(
        title: Text(arg.title),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColor.Gold_font),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.SurahDetailsL),
              Expanded(
                child: Center(
                  child: Text(
                    arg.title,
                    style: TextStyle(
                      color: AppColor.Gold_font,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Image.asset(AppAssets.SurahDetailsR),
            ],
          ),
          Expanded(
            child: Text(
              arg.body,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),

          Image.asset(AppAssets.SurahDetailsD),
        ],
      ),
    );
  }
}
