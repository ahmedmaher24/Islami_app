import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/theme/app_color.dart';
import 'package:islamic/core/theme/app_theme.dart';
import 'package:islamic/provider/radio_manager_provider.dart';
import 'package:islamic/screens/intro_screens/onborading.dart';
import 'package:islamic/screens/layout/hadith/hadeth_details.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'screens/layout/quran/surah_details.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/layout/layout_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => RadioManagerProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            Onboarding.routeName: (context) => Onboarding(),
            LayoutScreen.routeName: (context) => LayoutScreen(),
            SurahDetails.routeName: (context) => SurahDetails(),
            HadethDetails.routeName: (context) => HadethDetails(),
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
