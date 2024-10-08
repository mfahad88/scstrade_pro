import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:scstrade_pro/screens/onboard/onboard.dart';

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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboard(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: ConstraintLayout(
        children: [
          Image.asset("images/logo.gif",).applyConstraint(
              centerHorizontalTo: parent,
              centerVerticalTo: parent
          ),
        ],

      ),
    );
  }
}
