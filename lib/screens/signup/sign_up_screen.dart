import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/controller/signupController.dart';
import 'package:scstrade_pro/screens/signup/what_is_gender.dart';
import 'package:scstrade_pro/screens/signup/what_you_do_investment.dart';
import 'package:scstrade_pro/screens/signup/where_you_born.dart';
import 'package:scstrade_pro/screens/signup/your_birthday.dart';
import 'package:scstrade_pro/screens/signup/your_name_screen.dart';

/*class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}*/

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


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
                  child: Consumer<Signupcontroller>(builder: (context, value, child) => LinearProgressIndicator( value: value.percent),),
                )
            ),
            Expanded(
              child: Container(
                color: Colors.blueAccent,
                child: Navigator(
                  key: controller.mainNavigation,
                  initialRoute: '/yourNameScreen',
                  onGenerateRoute: (settings) {
                    if(settings.name=="/yourNameScreen"){
                      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const YourNameScreen());
                    }else if(settings.name=="/whatGender"){
                      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>const WhatIsGender());
                    }else if(settings.name=="/yourBirthday"){
                      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>YourBirthday());
                    }else if(settings.name == "/whereYourBorn"){
                      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const WhereYouBorn(),);
                    }else if(settings.name == "/WhatYouDoInvestment"){
                      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const WhatYouDoInvestment(),);
                    }
                    return null;
                  },
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                  if(controller.dob.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/whereYourBorn");
                  }
                  if(controller.pob.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/WhatYouDoInvestment");
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

