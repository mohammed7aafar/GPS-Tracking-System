import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme2 {
  static const Color primaryColor = Color(0xFF151925);
  static const Color secondaryColor = Color(0xFFE3F6F5);
  static const Color territoryColor = Color(0xFF3da9fc);
  static const Color textColor = Color(0xFF425CD8);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color primaryColor11 = Color(0xFF272C3A);
  static const Color primaryColor12 = Color(0xFF2F323D);
  static const Color primaryColor13 = Color(0xFF63656D);
  static const Color primaryColor14 = Color(0xFF7D7F85);
  static const Color primaryColor15 = Color(0xFF97989E);
  static const Color primaryColor16 = Color(0xFFB1B2B6);
  static const Color primaryColor17 = Color(0xFFCBCBCE);
  static const Color primaryColor18 = Color(0xFFE5E5E6);
  static const Color primaryColor19 = Color(0xFF242B40);
  static const Color primaryColor20 = Color(0xFF1C2131);
  static const Color primaryColor21 = Color(0xFF262C41);
  static const Color primaryColor22 = Color(0xFF353947);

  static const Color errorColor = Color(0xFFFF4539);
  static const Color addColor = Color(0xFFFEA103);
  static const Color editColor = Color(0xFF0A83FE);
  static const Color onlineColor = Color(0xFF4CAF4F);
  static const Color clearColor = Color(0xFF404A69);

  static ThemeData themeData() => new ThemeData(
        primaryColor: primaryColor,
        accentColor: territoryColor,
        splashColor: Colors.transparent,
        highlightColor: primaryColor11,
        cursorColor: territoryColor,
        unselectedWidgetColor: primaryColor18,
        cardColor: primaryColor20,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryColor20,
          unselectedItemColor: primaryColor18,
          selectedItemColor: territoryColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
              fontSize: 81,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
              color: primaryColor15),
          headline2: GoogleFonts.openSans(
              fontSize: 51,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5,
              color: primaryColor15),
          headline3: GoogleFonts.openSans(
              fontSize: 40, fontWeight: FontWeight.w400, color: primaryColor15),
          headline4: GoogleFonts.openSans(
              fontSize: 29,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
              color: primaryColor15),
          headline5: GoogleFonts.openSans(
              fontSize: 20, fontWeight: FontWeight.w400, color: primaryColor15),
          headline6: GoogleFonts.openSans(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: primaryColor15),
          subtitle1: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
              color: primaryColor15),
          subtitle2: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
              color: primaryColor15),
          bodyText1: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: primaryColor15),
          bodyText2: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
              color: primaryColor15),
          button: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
              color: primaryColor15),
          caption: GoogleFonts.openSans(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
              color: primaryColor15),
          overline: GoogleFonts.openSans(
              fontSize: 8,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              color: primaryColor15),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
