// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Inter',
  primaryColor: const Color(0xFFffbd5c),
  scaffoldBackgroundColor: const Color(0XFF3A3A3A),
  disabledColor: const Color(0xFF6f7275),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: const Color(0XFF1F1F1F),
  dividerColor: const Color(0XFF70AC12),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFFffbd5c),
    primary: const Color(0xFFffbd5c),
    secondary: const Color(0xFFffbd5c),
    error: const Color(0xFFdd3135),
  ),
  primarySwatch: AppColor.primarySwatchValueColor,
  useMaterial3: true,
  splashFactory: NoSplash.splashFactory,
);

class AppColor {
  static const int primarySwatchValue = 0xFFffbd5c;
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
