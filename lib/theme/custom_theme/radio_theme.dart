import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/app_theme.dart';

final radioTheme=RadioThemeData(
  fillColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return AppTheme.primaryColor;
      }else if(states.contains(WidgetState.disabled)){
        return AppTheme.darkGrey;
      } else{
        return AppTheme.lightGrey;
      }
    },
  ),

);