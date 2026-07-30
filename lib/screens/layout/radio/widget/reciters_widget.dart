import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:islamic/core/constant/app_assets.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/provider/radio_manager_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/radio_response_model.dart';
import '../../../../core/models/reciters_response_model.dart';

class RecitersWidget extends StatefulWidget {
  RecitersWidget({super.key, required this.model});
  Reciters model;
  @override
  State<RecitersWidget> createState() => _RecitersWidgetState();
}

class _RecitersWidgetState extends State<RecitersWidget> {
  @override
  String? url;
  void initState() {
    getUrl();
    // TODO: implement initState
    super.initState();
  }

  int count = 1;
  void getUrl() {
    url = "${widget.model.moshaf![0].server}002.mp3";
  }

  @override
  bool isMuted = true;
  Widget build(BuildContext context) {
    return Consumer<RadioManagerProvider>(
      builder: (context, RadioManagerProvider provider, child) {
        return Container(
          width: double.infinity,
          height: 140,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColor.Gold_font,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // صورة الموجة في الأسفل
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  child: Image.asset(
                    AppAssets.soundWave,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),
              // المحتوى (النص والأزرار)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.play(url!);
                        },
                        icon: Icon(
                          (provider.currentPlayingUrl == url! &&
                                  provider.isPlaying!)
                              ? CupertinoIcons.pause
                              : CupertinoIcons.play_arrow_solid,
                          color: AppColor.black,
                          size: 35,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (provider.currentPlayingUrl == url!) {
                            provider.stop();
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.stop_fill,
                          color: AppColor.black,
                          size: 35,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isMuted = !isMuted;
                          });
                          provider.setVolume(isMuted ? 1.0 : 0.0);
                        },
                        icon: Icon(
                          isMuted
                              ? CupertinoIcons.volume_up
                              : CupertinoIcons.volume_off,
                          color: AppColor.black,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
