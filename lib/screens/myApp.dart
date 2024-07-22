import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scstrade_pro/screens/onboard/onboard_one.dart';
import 'package:scstrade_pro/screens/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      routes: {
        '/OnboardOne': (context) => OnboardOne(),
      },
    );
  }
}

