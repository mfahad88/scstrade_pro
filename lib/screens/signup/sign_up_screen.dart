import 'dart:ui';

import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/controller/signup_controller.dart';
import 'package:scstrade_pro/screens/controller/theme_controller.dart';
import 'package:scstrade_pro/screens/signup/are_you_saving.dart';
import 'package:scstrade_pro/screens/signup/take_picture_screen.dart';
import 'package:scstrade_pro/screens/signup/upload_national_card.dart';
import 'package:scstrade_pro/screens/signup/what_company_name.dart';
import 'package:scstrade_pro/screens/signup/what_do_you_do.dart';
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
    SignupController controller= context.read<SignupController>();
    ThemeController themeController = context.read();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeController.themeData.scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child:  ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Consumer<SignupController>(builder: (context, value, child) => LinearProgressIndicator( value: value.percent),),
                )
            ),
            Expanded(
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
                    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const WhereYouBorn());
                  }else if(settings.name == "/WhatYouDoInvestment"){
                    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const WhatYouDoInvestment());
                  }else if (settings.name == "/AreYouSaving"){
                    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const AreYouSaving());
                  } else if(settings.name == "/WhatCompanyName"){
                    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const WhatCompanyName());
                  } else if (settings.name == "/WhatDoYouDo"){
                    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const WhatDoYouDo());
                  }else if(settings.name == "/UploadNationalCard"){
                    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const UploadNationalCard());
                  }else if(settings.name == "/takePicture"){
                    return MaterialPageRoute(builder: (context) => TakePictureScreen(camera: themeController.camera.first),);
                    // return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => TakePictureScreen(camera: themeController.camera.first));
                  }
                  return null;
                },
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
                  if(controller.living.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/AreYouSaving");
                  }

                  if(controller.saving.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/WhatCompanyName");
                  }

                  if(controller.company.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/WhatDoYouDo");
                  }

                  if(controller.occuption.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/UploadNationalCard");
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

