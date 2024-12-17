import 'package:flutter/material.dart';

import '../app_theme.dart';

final checkboxTheme=CheckboxThemeData(
  fillColor: WidgetStateProperty.resolveWith((states) {
    if(states.contains(WidgetState.selected)){
      return AppTheme.primaryColor;
    }else if(states.contains(WidgetState.disabled)){
      return AppTheme.darkGrey;
    }else{
      return AppTheme.whiteColor;
    }
  },),
  side: BorderSide(
    width: 1
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4.0)
  )
);