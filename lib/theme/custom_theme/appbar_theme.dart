import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/app_theme.dart';

AppBarTheme appBarTheme=const AppBarTheme(
  backgroundColor: AppTheme.primaryColor,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppTheme.whiteColor,
  ),
  iconTheme: IconThemeData(color: AppTheme.whiteColor),
);