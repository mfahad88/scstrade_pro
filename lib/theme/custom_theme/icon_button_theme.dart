
import 'package:flutter/material.dart';

import '../app_theme.dart';

final iconButtonTheme=IconButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.hovered)){
        return AppTheme.secondaryColor.withOpacity(0.5);
      }else if(states.contains(WidgetState.pressed)){
        return AppTheme.primaryColor;
      }else if(states.contains(WidgetState.disabled)){
        return AppTheme.darkGrey;
      }else{
        return AppTheme.secondaryColor;
      }
    },),
    foregroundColor: const WidgetStatePropertyAll(AppTheme.whiteColor),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)
    ))
  )
);