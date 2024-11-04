import 'package:flutter/material.dart';

ThemeData ttheme_light=ThemeData(
    cardTheme: CardTheme(
      color: Colors.white,
      shape: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xFFA5A5A5),
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(14.0)
      ),
    ),
    textTheme:  const TextTheme(
        headlineSmall: TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 16,
            fontWeight: FontWeight.w400
        ),
        headlineLarge:  TextStyle(
          color: Color(0xFF1D1D1D),
          fontSize: 32,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: Color(0xFF2CE52F),
          fontSize: 13.13,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w600,
        )
    ),

);