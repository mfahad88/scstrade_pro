import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/custom_theme/appbar_theme.dart';
import 'package:scstrade_pro/theme/custom_theme/icon_button_theme.dart';
import 'package:scstrade_pro/theme/custom_theme/icon_theme.dart';

import 'custom_theme/button_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/dropdown_menu_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/input_decoration_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/progress_indicator_theme.dart';
import 'custom_theme/radio_theme.dart';
import 'custom_theme/text_button_theme.dart';
import 'custom_theme/text_theme.dart';

// Define the theme
class AppTheme {
  AppTheme._();
  static const Color primaryColor = Color(0xFF40A829);
  static const Color secondaryColor = Color(0xFF33FF00);
  static const Color neutralColor = Color(0xFF333333);
  static const Color lightGrey = Color(0xFF9CA3AF);
  static const Color whiteColor = Colors.white;
  static const Color statusError = Color(0xFFF44336);
  static const Color statusSuccess = Color(0xFF4CAF50);
  static const Color darkGrey = Color(0xFF9CA3AF);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    fontFamily: 'Roboto', // Set default font family
    textTheme: textTheme,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: whiteColor,
      onSurface: neutralColor,
      error: statusError,
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    iconTheme: iconTheme ,
    iconButtonTheme: iconButtonTheme,
    appBarTheme: appBarTheme ,
    buttonTheme: buttonThemeData ,
    dropdownMenuTheme:dropdownMenuTheme,
    radioTheme: radioTheme,
    checkboxTheme: checkboxTheme,
    progressIndicatorTheme:progressIndicatorTheme

  );






}
