import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:get/get.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/signup/your_name_screen.dart';

class SignUpScreen extends StatefulWidget {
  String name="";
  double percent=0.0;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child:  ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF408829)), value: widget.percent,),
                )
            ),
            YourNameScreen(listener:(p0) => setState(() {
              widget.name=p0;
            }),),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if(widget.name.isNotEmpty){
                    setState(() {
                      widget.percent=0.1;
                    });
                  }

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFFFFFFF),
                  backgroundColor: const Color(0xFF12D18E)
                ),
                child: const Text(Appconstants.continu),
              ),
            )

          ],
        ),
      ),
    );
  }
}
