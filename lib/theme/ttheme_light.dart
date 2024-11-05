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
        bodyLarge: TextStyle(     //16
            color: Color(0xFF1D1D1D),
            fontWeight: FontWeight.w400
        ),
        headlineMedium:  TextStyle(     //34
          color: Color(0xFF1D1D1D),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(      //14
          color: Color(0xFF2CE52F),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w600,
        ),
      labelSmall: TextStyle(      //10
        color: Color(0xFF1D1D1D),
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
      ),
        titleLarge:TextStyle( //20
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        )
    ),

);