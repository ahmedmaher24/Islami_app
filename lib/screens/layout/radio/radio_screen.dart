import 'package:flutter/material.dart';
import 'package:islamic/Api/api_manager.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/core/models/radio_response_model.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/screens/layout/radio/widget/radio_widget.dart';

import 'package:islamic/screens/layout/radio/widget/reciters_widget.dart';

import '../../../core/models/reciters_response_model.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedIndex = 0;
  bool isMuted = true;

  late Future<RadioResponseModel> radioFuture;

  @override
  void initState() {
    super.initState();
    radioFuture = ApiManager.getRadioData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.radiobg),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Center(child: Image.asset(AppAssets.homeLogo)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  _buildRadioTab(
                    active: selectedIndex == 0,
                    title: "Radio",
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                        radioFuture = ApiManager.getRadioData();
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  _buildRadioTab(
                    active: selectedIndex == 1,
                    title: "Reciters",
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                        // Ideally here we would fetch reciters
                        // radioFuture = ApiManager.getRecitersData();
                      });
                    },
                  ),
                ],
              ),
            ),

            selectedIndex == 0
                ? FutureBuilder<RadioResponseModel>(
                    future: ApiManager.getRadioData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.Gold_font,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError || !snapshot.hasData) {
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Something went wrong",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    radioFuture = ApiManager.getRadioData();
                                  });
                                },
                                child: const Text("Try again"),
                              ),
                            ],
                          ),
                        );
                      }
                      RadioResponseModel data = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: data.radios?.length ?? 0,
                          itemBuilder: (context, index) {
                            return RadioWidget(model: data.radios![index]);
                          },
                        ),
                      );
                    },
                  )
                : FutureBuilder<RecitersResponseModel>(
                    future: ApiManager.getRecitersaData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.Gold_font,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError || !snapshot.hasData) {
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Something went wrong",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ApiManager.getRecitersaData();
                                  });
                                },
                                child: const Text("Try again"),
                              ),
                            ],
                          ),
                        );
                      }
                      RecitersResponseModel data = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: data.reciters?.length ?? 0,
                          itemBuilder: (context, index) {
                            return RecitersWidget(model: data.reciters![index]);
                          },
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Expanded _buildRadioTab({
    required bool active,
    required String title,
    required void Function() onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: active
                ? AppColor.Gold_font
                : Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: active ? AppColor.black : AppColor.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
