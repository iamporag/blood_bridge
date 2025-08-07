// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Inter',
  primaryColor: AppColor.primary,
  scaffoldBackgroundColor: AppColor.scaffoldBackground,
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: AppColor.cardColor,
  dividerColor: const Color(0XFF70AC12),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: const Color(0xFF112802),
    secondary: const Color(0xFFA0D74B),
    error: const Color(0xFFdd3135),
    seedColor: const Color(0xFF112802),
  ),
  primarySwatch: AppColor.primarySwatchValueColor,
  useMaterial3: true,
  splashFactory: NoSplash.splashFactory,
);

class AppColor {
  static const int primarySwatchValue = 0xFFFA5075;

  /* <-----------Colors------------*/
  // Primary Color of this App
  static const Color primary = Color(0xFFFA5075);

  // Others Color
  static const scaffoldBackground = Color(0xFFfafafa);
  // Used for page with box background
  static const Color scaffoldWithBoxBackground = Color(0xFFF7F7F7);
  static const Color cardColor = Color(0xFFF2F2F2);
  static const Color coloredBackground = Color(0xFFE4F8EA);
  static const Color placeholder = Color(0xFF8B8B97);
  static const Color textInputBackground = Color(0xFFF7F7F7);
  static const Color separator = Color(0xFFFAFAFA);
  static const Color gray = Color(0xFFE1E1E1);
  //Text Color
  static const Color headingText = Color.fromRGBO(9, 65, 56, 1);
  static const Color bodyText = Color.fromRGBO(62, 99, 4, 1);
  static const Color subText = Color.fromRGBO(62, 99, 4, 1);
  static const Color whiteTextColor = Colors.white;

  // Border & Divider
  static const Color borderColor = Color.fromRGBO(160, 215, 75, 1);
  static const Color dividerColor = Color.fromRGBO(112, 172, 18, 1);
  static const MaterialColor primarySwatchValueColor = MaterialColor(
    primarySwatchValue,
    <int, Color>{
      50: Color(primarySwatchValue),
      100: Color(primarySwatchValue),
      200: Color(primarySwatchValue),
      300: Color(primarySwatchValue),
      400: Color(primarySwatchValue),
      500: Color(primarySwatchValue),
      600: Color(primarySwatchValue),
      700: Color(primarySwatchValue),
      800: Color(primarySwatchValue),
      900: Color(primarySwatchValue),
    },
  );
}
