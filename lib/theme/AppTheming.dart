import 'package:collegehub/theme/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheming {
  static ThemeData LightTheme = ThemeData(
    cardTheme: CardTheme(
      color: AppColor.HomeTap,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.AppBarColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.lemonada(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColor.ScaffoldColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0XFF212529),
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.playfairDisplay(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      headlineLarge: GoogleFonts.elMessiri(
          fontSize: 25,
          wordSpacing: 4,
          fontWeight: FontWeight.bold,
          color: AppColor.whiteColor),
      headlineMedium: GoogleFonts.elMessiri(
          fontSize: 20,
          wordSpacing: 4,
          fontWeight: FontWeight.w400,
          color: AppColor.whiteColor),
      headlineSmall: GoogleFonts.elMessiri(
          fontSize: 15,
          wordSpacing: 4,
          fontWeight: FontWeight.w400,
          color: AppColor.whiteColor),
      labelLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          wordSpacing: 4,
          fontWeight: FontWeight.bold,
          color: AppColor.whiteColor),
    ),
    // dividerTheme:
    //     DividerThemeData(color: AppColor.PraimaryColor, thickness: 3),
    iconTheme: IconThemeData(
      color: AppColor.whiteColor,
    ),
    brightness: Brightness.light,
  );

  static ThemeData DarckTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: AppColor.DarchPraimaryColor,
        selectedItemColor: AppColor.YalowwColor,
        unselectedItemColor: AppColor.whiteColor,
      ),
      // textTheme: TextTheme(
      //   headlineLarge: GoogleFonts.elMessiri(
      //       fontSize: 30,
      //       wordSpacing: 4,
      //       fontWeight: FontWeight.bold,
      //       color: AppColor.whiteColor),
      //   headlineMedium: GoogleFonts.elMessiri(
      //       fontSize: 25,
      //       wordSpacing: 4,
      //       fontWeight: FontWeight.w400,
      //       color: AppColor.YalowwColor),
      //   headlineSmall: GoogleFonts.elMessiri(
      //       fontSize: 25, wordSpacing: 4, color: AppColor.whiteColor),
      //   labelLarge: GoogleFonts.elMessiri(
      //       fontSize: 30,
      //       wordSpacing: 4,
      //       fontWeight: FontWeight.bold,
      //       color: AppColor.BlackColor),
      //   labelMedium: GoogleFonts.elMessiri(
      //       fontSize: 30,
      //       wordSpacing: 4,
      //       fontWeight: FontWeight.bold,
      //       color: AppColor.whiteColor),
      // ),
      // dividerTheme: DividerThemeData(color: AppColor.YalowwColor, thickness: 3),
      // iconTheme: IconThemeData(
      //   color: AppColor.YalowwColor,
      // ),
      // cardTheme: CardTheme(
      //   color: AppColor.DarchPraimaryColor,
      // ),
      brightness: Brightness.dark);
}
