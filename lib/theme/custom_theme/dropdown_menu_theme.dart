import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/custom_theme/input_decoration_theme.dart';

import '../app_theme.dart';

final dropdownMenuTheme = DropdownMenuThemeData(
  menuStyle: MenuStyle(
    shape: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.pressed)){
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: AppTheme.secondaryColor,width: 1)
        );
      }else{
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppTheme.darkGrey,width: 1)
        );
      }
    },),
  ),
  textStyle: const TextStyle(
   fontWeight: FontWeight.w400,
   fontSize: 16,
    color: AppTheme.neutralColor
  )

);