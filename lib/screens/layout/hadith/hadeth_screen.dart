import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/core/theme/app_theme.dart';
import 'package:islamic/screens/layout/hadith/models/hadeth_data.dart';
import 'package:islamic/screens/layout/hadith/widget/hadeth_card.dart';
import 'package:sizer/sizer.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> ahadeth = [];
  @override
  void initState() {
    //السطر ده عشان اقوله لم تعمل rebuild اتاكد من ان كل حاجه تمام وارجع نفذ دى تانى
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      readHadeth();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadeth),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.homeLogo),
            ahadeth.isEmpty
                ? CircularProgressIndicator()
                : Expanded(
                    child: CarouselSlider.builder(
                      itemCount: ahadeth.length,
                      itemBuilder: (context, index, realIndex) {
                        return HadethCard(hadethData: ahadeth[index]);
                      },
                      options: CarouselOptions(
                        height: 70.h,
                        enableInfiniteScroll: true,
                        pageSnapping: true,
                        disableCenter: true,
                        animateToClosest: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  readHadeth() async {
    for (int i = 1; i <= 50; i++) {
      String fullHadeth = await rootBundle.loadString("assets/Hadeeth/h$i.txt");
      List<String> hadeth = fullHadeth.split("\n");
      ahadeth.add(HadethData(title: hadeth[0].trim(), body: hadeth[1].trim()));
      setState(() {});
    }
  }
}
