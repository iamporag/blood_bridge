// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_const_constructors, use_full_hex_values_for_flutter_colors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static const Color PRIMARY_COLOR = Color.fromRGBO(206, 147, 216, 1);
  static const Color ON_PRIMARY_COLOR = Color(0xFFFFFFFF);
  static const Color SECONDARY_COLOR = Color.fromRGBO(244, 143, 177, 1);
  static const Color TERTIARY_COLOR = Color.fromRGBO(255, 204, 128, 1);
  static const Color PRIMARY_GRADIENT = Color(0xFFD32F2F);
  static const Color PRIMARY_DEEP = Color(0xffb40f4d);
  static const Color ERROR_COLOR = Color(0xFFD32F2F);
  static const Color OUTLINE_COLOR = Color(0xFF424242);
  static const Color DARK_BG = Color(0xff000000);
  static const Color DARK_BG_VARIANT = Color(0xff333333);
  static const Color ON_DARK_BG = Color(0xfffafafa);
  static const Color LIGHT_BG = Color(0xffffffff);
  static const Color LIGHT_BG_VARIANT = Color(0x28ff77b2);
  static const Color ON_LIGHT_BG = Color(0xff232222);
  static const Color ON_LIGHT_VARIANT = Color(0xff838383);
  static const Color ON_LIGHT_TEXT_COLOR = Color(0xffF5F8FB);
  static const Color ON_DARK_TEXT_COLOR = Color(0xff000000);

  static ThemeData APP_THEME_LIGHT = ThemeData(
    primaryColor: PRIMARY_COLOR,
    primaryColorDark: PRIMARY_DEEP,
    primaryColorLight: PRIMARY_COLOR,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: PRIMARY_COLOR,
      onPrimary: ON_PRIMARY_COLOR,
      secondary: SECONDARY_COLOR,
      surfaceTint: Color(4284831119),
      primaryContainer: Color(4282988913),
      onPrimaryContainer: Color(4294967295),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282988913),
      onSecondaryContainer: Color(4294967295),
      tertiary: TERTIARY_COLOR,
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285214533),
      onTertiaryContainer: Color(4294967295),
      error: ERROR_COLOR,
      onError: Color(4294967295),
      errorContainer: Color(4285411116),
      onErrorContainer: Color(4294967295),
      background: LIGHT_BG,
      onBackground:DARK_BG,
      surface: Color(4294834175),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293320940),
      onSurfaceVariant: Color(4280623915),
      outline: Color(4282663242),
      outlineVariant: Color(4282663242),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inversePrimary: Color(4294043903),
      primaryFixed: Color(4282988913),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281475929),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282988913),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281475929),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285214533),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283439407),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294834175),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439674),
      surfaceContainer: Color(4294110452),
      surfaceContainerHigh: Color(4293715694),
      surfaceContainerHighest: Color(4293321193),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 28.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w300,
        fontSize: 12.sp,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 22.sp,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 11.sp,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 10.sp,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 8.sp,
      ),
    ),
  );

  static ThemeData APP_THEME_DARK = ThemeData(
    primaryColor: PRIMARY_COLOR,
    primaryColorDark: PRIMARY_DEEP,
    primaryColorLight: PRIMARY_COLOR,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965759),
      surfaceTint: Color(4291804670),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292067839),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965759),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292067839),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294948813),
      onTertiaryContainer: Color(4278190080),
      error: Color.fromARGB(255, 255, 0, 0),
      onError: Color(4278190080),
      errorContainer: Color(4294949299),
      onErrorContainer: Color(4278190080),
      background: Color(4279505432),
      onBackground: Color(4293320937),
      surface: Color(4279505688),
      onSurface: Color(0xffF5F8FB),
      surfaceVariant: Color(4282926414),
      onSurfaceVariant: Color(4294900223),
      outline: Color(0xff677294),
      outlineVariant: Color(0Xff8F959E),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321193),
      inversePrimary: Color(4281278550),
      primaryFixed: Color(4293780223),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292067839),
      onPrimaryFixedVariant: Color(4279961922),
      secondaryFixed: Color(4293780223),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292067839),
      onSecondaryFixedVariant: Color(4279961922),
      tertiaryFixed: Color(4294959079),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294948813),
      onTertiaryFixedVariant: Color(4281532952),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4282005566),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280032032),
      surfaceContainer: Color(4280360740),
      surfaceContainerHigh: Color(4281018671),
      surfaceContainerHighest: Color(4281742394),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 28.sp,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 22.sp,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w300,
        fontSize: 12.sp,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 11.sp,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 10.sp,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 8.sp,
      ),
    ),
  );
}
