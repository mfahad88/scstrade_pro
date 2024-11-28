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
      bodyLarge: TextStyle(     //16
          color: Colors.white,
          fontWeight: FontWeight.w400
      ),
      headlineMedium:  TextStyle(   //34
        color: Colors.white,
        fontSize: 32,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(      //14
        color: Color(0xFF1D1D1D),
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(  //10
        color: Colors.white,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
      ),
      titleLarge:TextStyle( //20
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
      )
  ),

);