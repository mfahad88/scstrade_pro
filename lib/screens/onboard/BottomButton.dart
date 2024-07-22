import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scstrade_pro/screens/onboard/OnBoardViewModel.dart';

import '../views/my_button.dart';

class Bottombutton extends StatelessWidget {
  final Onboardviewmodel controller;
  const Bottombutton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0,bottom: 25.0),
          child: MyButton(text: "Previous",
              textColor: Color(0xFF12D18E),
              backgroundColor: Color(0xFFE7FAF4),
              iconData: Icons.arrow_back,
              rtl: true,
              borderRadius: 10,onPressed: (){
                if(controller.count>1) {
                  controller.decrement();
                }
              }),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(right: 25.0,bottom: 25.0),
          child: MyButton(text: "Next",
              textColor: Color(0xFFFFFFFF),
              backgroundColor: Color(0xFF12D18E),
              iconData: Icons.arrow_forward,
              borderRadius: 10,onPressed: (){
                if(controller.count<6) {
                  controller.increment();
                }
                if(controller.count>5){
                  Navigator.of(context).pushNamed("/OnboardOne");
                }
              }),
        )
      ],
    );
  }
}
