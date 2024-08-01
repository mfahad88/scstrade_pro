import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/screens/onboard/BottomButton.dart';
import 'package:scstrade_pro/screens/signup/sign_up_screen.dart';
import 'package:scstrade_pro/widgets/paint/circle_paint.dart';
import 'package:scstrade_pro/widgets/paint/oval_paint.dart';

import '../../provider/signup_controller.dart';
import '../../provider/theme_controller.dart';


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
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Image.asset("images/logo.gif",
                  width: 250,
                  height: 170,
                  fit: BoxFit.contain),
                ),
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
                        value.counter==1?Padding(padding: const EdgeInsets.only(left:0,right: 30.0,bottom: 10), child: CustomPaint(painter: OvalPaint())):Padding(padding: const EdgeInsets.only(left: 0.0), child: CustomPaint(painter: CirclePaint())),
                        value.counter==2?Padding(padding: const EdgeInsets.only(left:10,right: 30.0,bottom: 10), child: CustomPaint(painter: OvalPaint())):Padding(padding: const EdgeInsets.only(left: 15.0), child: CustomPaint(painter: CirclePaint())),
                        value.counter==3?Padding(padding: const EdgeInsets.only(left:10,right: 30.0,bottom: 10), child: CustomPaint(painter: OvalPaint())):Padding(padding: const EdgeInsets.only(left: 15.0), child: CustomPaint(painter: CirclePaint())),
                        value.counter==4?Padding(padding: const EdgeInsets.only(left:10,right: 30.0,bottom: 10), child: CustomPaint(painter: OvalPaint())):Padding(padding: const EdgeInsets.only(left: 15.0), child: CustomPaint(painter: CirclePaint())),
                        value.counter==5?Padding(padding: const EdgeInsets.only(left:10,right: 30.0,bottom: 10), child: CustomPaint(painter: OvalPaint())):Padding(padding: const EdgeInsets.only(left: 15.0), child: CustomPaint(painter: CirclePaint()))
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



