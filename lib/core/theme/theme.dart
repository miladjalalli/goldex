import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      // فعال‌سازی Material 3
      fontFamily: 'opensans',
      brightness: Brightness.light,
      primaryColor: Color(0xFF50C878),
      // سبز
      colorScheme: ColorScheme.light(
        primary: Color(0xffE1FFEB),
        secondary: Color(0xff068B4D),
        tertiary: Color(0xff707070),
        onPrimaryContainer: Color(0xff4F4F4F),
        onSecondaryContainer: Color(0xff959595),
        onTertiaryContainer: Color(0xff565656),
        primaryContainer: Color(0xffCCCCCC),
        secondaryContainer: Color(0xffE6E6E6),
        tertiaryContainer: Color(0xffE7E7E7),
        surface: Colors.white,
        background: Colors.white,
        onPrimary: Color(0xff494949),
        onSecondary: Colors.white,
        onTertiary: Color(0xfff2f2f2),
        onSurface: Colors.black,
        onBackground: Colors.black,
        error: Colors.red,
        onError: Colors.white,

      ),
      appBarTheme: AppBarTheme(
        color: Color(0xFF4CAF50), // رنگ AppBar
        titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4CAF50), // رنگ دکمه‌های elevated
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Color(0xFF4CAF50), // رنگ دکمه‌های TextButton
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
      ),
      iconTheme: IconThemeData(color: Color(0xFF4CAF50)),
      // رنگ آیکن‌ها
      cardColor: Colors.white,
      dividerColor: Colors.black.withOpacity(0.1),
      );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // فعال‌سازی Material 3
    fontFamily: 'opensans',
    brightness: Brightness.dark,
    primaryColor: Color(0xFF50C878),
    // سبز
    colorScheme: ColorScheme.dark(
      primary: Color(0xffE1FFEB),
      secondary: Color(0xff068B4D),
      tertiary: Color(0xff707070),
      onPrimaryContainer: Color(0xff4F4F4F),
      onSecondaryContainer: Color(0xff959595),
      onTertiaryContainer: Color(0xff565656),
      primaryContainer: Color(0xffCCCCCC),
      secondaryContainer: Color(0xffE6E6E6),
      tertiaryContainer: Color(0xffE7E7E7),
      surface: Colors.black,
      background: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Color(0xfff2f2f2),
      onSurface: Colors.white,
      onBackground: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xFF4CAF50), // رنگ AppBar
      titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4CAF50), // رنگ دکمه‌های elevated
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF4CAF50), // رنگ دکمه‌های TextButton
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.blue, width: 1),
      ),
    ),
    iconTheme: IconThemeData(color: Color(0xFF4CAF50)),
    // رنگ آیکن‌ها
    cardColor: Colors.black,
    dividerColor: Colors.white.withOpacity(0.1),
      textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Color(0xff494949)),
          bodyLarge: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Color(0xff494949)),
          titleSmall:TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ))
  );
}


const Color colorLightGrey = Color(0xffF2F2F2);

const Color colorPending = Color(0xffE8BB41);
const Color colorFailed = Color(0xffE13C22);

const Color colorGold = Color(0xffC6903B);

const Color colorRedBack = Color(0xfffbe9e7);
const Color colorRed = Color(0xff900B09);
const Color colorRedLight = Color(0xffC00F0C);

const Color colorGreenBack = Color(0xffE1FFEB);
const Color colorGreen = Color(0xff50C878);
const Color colorDarkGreen = Color(0xff068B4D);

const Color colorDarkGreyNavigation = Color(0xff181818);
const Color colorDarkGrey = Color(0xff303030);
