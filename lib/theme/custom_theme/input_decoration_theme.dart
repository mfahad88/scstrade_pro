// Input Decoration Theme
import 'package:flutter/material.dart';

import '../app_theme.dart';

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppTheme.lightGrey.withOpacity(0.1),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppTheme.lightGrey),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppTheme.lightGrey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppTheme.primaryColor),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppTheme.statusError),
  ),
  labelStyle: const TextStyle(color: AppTheme.neutralColor, fontSize: 16),
  hintStyle: const TextStyle(color: AppTheme.lightGrey, fontSize: 14),
);