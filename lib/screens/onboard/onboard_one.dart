
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scstrade_pro/screens/onboard/BottomButton.dart';
import 'package:scstrade_pro/screens/views/my_button.dart';

import 'OnBoardViewModel.dart';

class OnboardOne extends StatelessWidget {
  final controller=Get.put(Onboardviewmodel());
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraints) {
             return ConstrainedBox(
               constraints: BoxConstraints(
                 minHeight: constraints.maxHeight
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Expanded(
                     flex: 5,
                     child: Image.asset("images/logo.gif"),
                   ),
                   const Expanded(
                       flex: 1,
                       child: Padding(
                         padding: EdgeInsets.only(left: 20, right: 20),
                         child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis nulla id libero commodo facilisis sit amet et nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse non gravida libero.",
                           style: TextStyle(
                               decoration: TextDecoration.none,
                               fontSize: 12,
                               color: Colors.black54
                           ),
                         ),
                       )
                   ),
                   Expanded(
                       flex: 1,
                       child: GetX<Onboardviewmodel>(builder: (controller) {
                         return Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             controller.count.value==1?Padding( padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                             controller.count.value==2?Padding( padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                             controller.count.value==3?Padding( padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                             controller.count.value==4?Padding( padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                             controller.count.value==5?Padding( padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                           ],
                         );
                       },)
                   ),
                   Expanded(
                       flex: 1,
                       child: GetX<Onboardviewmodel>(builder: (controller) {
                         if(controller.count<6) {
                           return Bottombutton(controller: controller);
                         }else{
                           return Column(
                             mainAxisSize: MainAxisSize.min,
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                             children: [
                               Expanded(
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
                                   child: ElevatedButton(onPressed: (){
                                   },
                                     style: ElevatedButton.styleFrom(
                                         backgroundColor: const Color(0xFF12D18E),
                                         foregroundColor: const Color(0xFFFFFFFF),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20.0)
                                         )
                                     ), child: const Text("Sign up"),
                                   ),
                                 ),
                               ),
                               Expanded(
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
                                   child: ElevatedButton(onPressed: (){
                                   },
                                     style: ElevatedButton.styleFrom(
                                         backgroundColor: const Color(0xFFE7FAF4),
                                         foregroundColor: const Color(0xFF12D18E),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(20.0)
                                         )
                                     ), child: const Text("Sign in"),
                                   ),
                                 ),
                               )

                             ],
                           );
                         }
                       },)
                   )
                 ],
               ),
             );
            },

          ),
        ),
      ),
    );
  }
}

