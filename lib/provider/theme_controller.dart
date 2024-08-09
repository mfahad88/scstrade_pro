import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeController extends ChangeNotifier{

  ThemeData themeData =  ThemeData(
    primaryColor:const Color(0xFF408829),
    primaryColorDark: const Color(0xFF33FF00),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearTrackColor: Color(0xFFAABBCC),
        color: Color(0xFF408829)
    ),
    radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
            if(states.contains(WidgetState.selected)) {
              return  const Color(0xFF33FF00);
            }else{
              return Colors.grey.shade500;
            }
          }
        )
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) =>
            const Color(0xFF12D18E)),
            foregroundColor: WidgetStateProperty.resolveWith((states) => const Color(0xFFFFFFFF))
        )
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F4EC),
    textTheme: ThemeData.light().textTheme.copyWith(
        headlineLarge: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF212121)
        ),
        headlineMedium: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 24,
            color: Color(0xFF212121),
            fontWeight: FontWeight.w600
        ),
        bodyMedium: const TextStyle(
            fontFamily:'Urbanist',
            fontSize: 16,
            color: Color(0xFF212121)
        ),

        bodyLarge:  const TextStyle(
            fontFamily:'Urbanist',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFF212121)
        )
    ),
  );

}