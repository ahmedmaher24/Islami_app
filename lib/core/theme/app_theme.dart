import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/theme/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.tajawal().fontFamily,
    primaryColor: AppColor.Gold_font,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColor.Gold_font,
        fontSize: 24,
        backgroundColor: Colors.transparent,
      ),
      centerTitle: true,
    ),
    iconTheme: IconThemeData(color: AppColor.Gold_font),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: AppColor.onSurface,
      ),
      bodyMedium: TextStyle(fontSize: 20, color: AppColor.onPrimary),
      bodySmall: TextStyle(fontSize: 16, color: AppColor.onPrimary),
    ),
  );
}
