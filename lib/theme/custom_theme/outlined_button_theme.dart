
import 'package:flutter/material.dart';

import '../app_theme.dart';

OutlinedButtonThemeData outlinedButtonTheme=OutlinedButtonThemeData(
    style:ButtonStyle(
      side: WidgetStateBorderSide.resolveWith((states) {
        if(states.contains(WidgetState.disabled)){
          return BorderSide(
            width: 1,
            color: AppTheme.lightGrey.withOpacity(0.5)
          );
        }else{
          return const BorderSide(
            width: 1,
            color: AppTheme.primaryColor
          );
        }
      },),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if(states.contains(WidgetState.hovered)){
            return AppTheme.primaryColor.withOpacity(0.8);
          }else if(states.contains(WidgetState.pressed)){
            return AppTheme.primaryColor.withOpacity(0.1);
          }else if(states.contains(WidgetState.disabled)){
            return AppTheme.whiteColor;
          }else{
            return AppTheme.whiteColor;
          }
        },),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if(states.contains(WidgetState.disabled)){
            return AppTheme.darkGrey;
          }else{
            return AppTheme.secondaryColor;
          }
        },),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ))
    )
);