import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/signup/signupController.dart';
import 'package:scstrade_pro/screens/signup/what_is_gender.dart';
import 'package:scstrade_pro/screens/signup/your_name_screen.dart';

/*class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}*/

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Signupcontroller>(
      builder: (BuildContext context, Signupcontroller controller, Widget? child) {
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
                      child: LinearProgressIndicator(valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF408829)), value: controller.percent),
                    )
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,
                    child: Navigator(
                      key: controller.mainNavigation,
                      initialRoute: '/yourNameScreen',
                      onGenerateRoute: (settings) {
                        if(settings.name=="/yourNameScreen"){
                          return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => YourNameScreen());
                        }else if(settings.name=="/whatGender"){
                          return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => WhatIsGender());
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      if(controller.fullName.isNotEmpty) {
                        controller.addPercent();
                        controller.mainNavigation.currentState!.pushReplacementNamed("/whatGender");
                      }
                      if(controller.gender.isNotEmpty){
                        controller.addPercent();
                      }


                      /* if(controller.fullName.isNotEmpty){
                          controller.percent+=0.1;
                        }*/
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
      },

    );
  }
}

