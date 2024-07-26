import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/controller/signupController.dart';
import 'package:scstrade_pro/screens/signup/what_is_gender.dart';
import 'package:scstrade_pro/screens/signup/your_birthday.dart';
import 'package:scstrade_pro/screens/signup/your_name_screen.dart';

/*class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}*/

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Signupcontroller controller= context.read<Signupcontroller>();
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
                  child: LinearProgressIndicator( value: controller.percent),
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
                    }else if(settings.name=="/yourBirthday"){
                      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => YourBirthday());
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
                    controller.mainNavigation.currentState!.pushNamed("/whatGender");
                  }
                  if(controller.gender.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/yourBirthday");
                  }


                },

                child: const Text(Appconstants.continu),
              ),
            )

          ],
        ),
      ),
    );
  }
}

