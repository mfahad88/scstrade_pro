

// Elevated Button Theme
import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/app_theme.dart';

final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppTheme.primaryColor,
    foregroundColor: AppTheme.whiteColor,
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    shadowColor: AppTheme.darkGrey
  ),
);