import 'dart:async';

import 'package:flutter/material.dart';

import '../onboard/onboard_one.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed("/OnboardOne");
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:MaterialApp(
        home: Container (
            color: Colors.white,
            child: Image.asset("images/logo.gif")
        ),
      ),
    );
  }
}
