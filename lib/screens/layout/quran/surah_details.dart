import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/screens/layout/quran/quran_screen.dart';
import 'package:islamic/screens/layout/quran/widget/quran_card_widget.dart';

import 'models/sura_data.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "surahDetails";
  SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  late var theme = Theme.of(context);
  String surahDetails = "";
  List<String> aya = [];
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as SuraContant;

    if (surahDetails.isEmpty) {
      readFile(arg.index);
    }

    return Scaffold(
      backgroundColor: AppColor.backgroundQuranDetails,
      appBar: AppBar(
        title: Text(arg.nameEn),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColor.Gold_font), // تغيير لون السهم
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.SurahDetailsL),
                  Expanded(
                    child: Center(
                      child: Text(
                        arg.nameAr,
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
              Center(
                child: Text(
                  "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                  style: TextStyle(color: AppColor.Gold_font, fontSize: 24),
                ),
              ),
            ],
          ),
          Expanded(
            child: surahDetails.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: AppColor.Gold_font),
                  )
                : SingleChildScrollView(
                    child: Text.rich(
                      TextSpan(
                        children: aya.map((e) {
                          int index = aya.indexOf(e);
                          return TextSpan(
                            text: e,

                            children: [
                              TextSpan(
                                text: " [${(index + 1)}] ".toString(),
                                style: TextStyle(color: AppColor.surface),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColor.Gold_font,
                        fontSize: 24,
                        height: 1.8,
                        fontFamily: GoogleFonts.amiriQuran().fontFamily,
                      ),
                    ),
                  ),
          ),
          Image.asset(AppAssets.SurahDetailsD),
        ],
      ),
    );
  }

  //انا هنا بستنى الfile يجى كامل ف بعمل async and await
  void readFile(int index) async {
    surahDetails = await rootBundle.loadString("assets/suras/${index + 1}.txt");
    // انا اول ما بشوف n\بقوله حطها فى سطر لوحدها و trim دى امسح اى زياده

    aya = surahDetails.trim().split("\n");
    setState(() {});
  }
}
