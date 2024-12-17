import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/app_theme.dart';

final textButtonTheme=TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.disabled)){
          return AppTheme.darkGrey;
        }else{
          return AppTheme.secondaryColor;
        }
      },),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.hovered)){
          return AppTheme.secondaryColor.withOpacity(0.8);
        }else if(states.contains(WidgetState.pressed)){
          return AppTheme.secondaryColor.withOpacity(0.1);
        }else{
          return AppTheme.whiteColor;
        }
      },),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0)
      )),

    )
);