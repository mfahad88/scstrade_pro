import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:scstrade_pro/screens/onboard/onboard.dart';
import 'package:scstrade_pro/screens/splash/splash.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor:const Color(0xFF408829),
        primaryColorDark: const Color(0xFF33FF00),
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
            fontSize: 18,
            color: Color(0xFF212121)
          )
        ),
      ),
      home: Onboard(),
      /*routes: {
        '/OnboardOne': (context) => OnboardOne(),
        '/SignUp':(context) => SignUpScreen()
      },*/
    );
  }
}

