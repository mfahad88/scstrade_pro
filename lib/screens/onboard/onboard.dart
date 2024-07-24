
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/onboard/BottomButton.dart';
import 'package:scstrade_pro/screens/signup/sign_up_screen.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int counter=1;

  @override
  Widget build(BuildContext context) {

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
          const Spacer(flex: 1,),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Text(Appconstants.Lorem_ipsum,
              style: context.textTheme.bodyMedium),
            ),
          const Spacer(flex: 8,),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  counter==1?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                  counter==2?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                  counter==3?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                  counter==4?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                  counter==5?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                ],
              ),
            ),
        
            Bottombutton(onPressedNext: (){
              setState(() {
                if(counter<5) {
                  counter++;
                }
                if(counter==5){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                }
              });
            },onPressedPrevious: (){
              setState(() {
                if(counter>1){
                  counter--;
                }
              });
            })
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage("images/logo.gif"), context);

  }
}



