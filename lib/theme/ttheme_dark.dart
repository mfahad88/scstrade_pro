import 'package:flutter/material.dart';

ThemeData ttheme_dark=ThemeData(
    brightness: Brightness.dark,
    cardTheme: CardTheme(
      color: Color(0xFF142117),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(width: 0.66, color: Color(0xFF5A5A5A)),
      ),
      shadowColor: Color(0x8C000000)
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400
      ),
      headlineLarge:  TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: Color(0xFF1D1D1D),
        fontSize: 13.13,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w600,
      )
    ),

);