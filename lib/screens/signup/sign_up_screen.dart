import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/signup_controller.dart';
import 'package:scstrade_pro/screens/loginsignup/login_signup.dart';
import 'package:scstrade_pro/screens/signup/any_experience.dart';
import 'package:scstrade_pro/screens/signup/are_you_saving.dart';
import 'package:scstrade_pro/screens/signup/contact_detail.dart';
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
    FocusManager.instance.primaryFocus?.unfocus();
    SignupController controller= context.read<SignupController>();
    ThemeController themeController = context.read();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          if(controller.mainNavigation.currentState!.canPop()){
            controller.mainNavigation.currentState!.pop();
          }else{
            Navigator.pop(context);
          }

          // controller.mainNavigation.currentState!.widget.key==null?Navigator.pop(context):controller.mainNavigation.currentState!.pop();
        }, icon: const Icon(Icons.arrow_back,color: Colors.black)),
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
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const YourNameScreen());
                  }else if(settings.name=="/whatGender"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const WhatIsGender());
                  }else if(settings.name=="/yourBirthday"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const YourBirthday());
                  }else if(settings.name == "/whereYourBorn"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const WhereYouBorn());
                  }else if(settings.name == "/WhatYouDoInvestment"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation)=> const WhatYouDoInvestment());
                  }else if (settings.name == "/AreYouSaving"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const AreYouSaving());
                  }else if (settings.name == "/anyExperience"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const AnyExperience());
                  }else if (settings.name == "/contactDetail"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const ContactDetail());
                  }
                  else if(settings.name == "/WhatCompanyName"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const WhatCompanyName());
                  } else if (settings.name == "/WhatDoYouDo"){
                    return PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => const WhatDoYouDo());
                  }else {
                    // Navigator.pop(context);
                    return null;
                  }
                },
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if(controller.fullName.isNotEmpty && controller.fullName!="") {
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/whatGender");
                  }
                  if(controller.gender.isNotEmpty && controller.gender!=""){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/yourBirthday");
                  }
                  if(controller.dob.isNotEmpty && controller.dob!=""){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/anyExperience");
                  }
                  if(controller.experience.isNotEmpty && controller.experience!=""){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/contactDetail");
                  }if(controller.phone.isNotEmpty && controller.phone!=""){
                    controller.addPercent();
                    _showSuccessDialog(context);
                  }
                  /* if(controller.dob.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/whereYourBorn");
                  }*/
                  /*  if(controller.pob.isNotEmpty){
                    controller.addPercent();
                    controller.mainNavigation.currentState!.pushNamed("/WhatYouDoInvestment");
                  }*/
                 /* if(controller.living.isNotEmpty){
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
                  }*/


                },

                child: const Text(Appconstants.continu),
              ),
            )

          ],
        ),
      ),
    );
  }

  Future<void> _showSuccessDialog(BuildContext context) {
    ThemeController controller=context.read<ThemeController>();
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (context) {

      return Dialog(

        backgroundColor: const Color(0xFFFFFFFF),
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () async => await Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const LoginSignup()),(route) => false,),
                    child: Container(
                        margin: const EdgeInsets.only(right: 15,top: 10),
                        child: const Icon(Icons.close_rounded,color: Colors.black, size: 24.0,)),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Image(
                    image: AssetImage("images/success.png"),
                    width: 100,
                    fit: BoxFit.cover,
                ),
              ),
              Container(

                margin: const EdgeInsets.only(top: 10),
                child: Text("Successful!",style: controller.themeData.textTheme.bodyMedium!.copyWith(
                  color: const Color(0xFF12D18E),
                  fontWeight: FontWeight.w500
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15,left: 20,right: 20),
                child: Text("Your account has been created.\nPlease wait a moment, we are preparing for you...",style: controller.themeData.textTheme.bodyMedium,
                textAlign: TextAlign.center),
              )
            ],
          ),
        ),
      );
    });
  }
}

