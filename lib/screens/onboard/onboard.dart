import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/controller/theme_controller.dart';
import 'package:scstrade_pro/screens/onboard/BottomButton.dart';
import 'package:scstrade_pro/screens/signup/sign_up_screen.dart';

import '../controller/signup_controller.dart';


class Onboard extends StatelessWidget {
  const Onboard({super.key});


  @override
  Widget build(BuildContext context) {
   SignupController controller = context.read<SignupController>();
   ThemeController themeController = context.read<ThemeController>();
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Image.asset("images/logo.gif",
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/3,
                fit: BoxFit.scaleDown),
              ),
            const Spacer(flex: 1),
              Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                child: Text(Appconstants.Lorem_ipsum,
                style: themeController.themeData.textTheme.bodyMedium),
              ),
            const Spacer(flex: 8,),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child:Consumer<SignupController>(
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        value.counter==1?Padding( padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                        value.counter==2?Padding( padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                        value.counter==3?Padding( padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                        value.counter==4?Padding( padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                        value.counter==5?Padding( padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding:  EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                      ],
                    );
                  },
                ),
              ),
          
              Bottombutton(onPressedNext: (){
                if(controller.counter<5) {
                  controller.addCounter();
                }
                if(controller.counter==5){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                }
              },onPressedPrevious: (){
                if(controller.counter>1){
                  controller.decCounter();
                }
              })
            ],
          ),
        ),
    );
  }

}



