import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/controller/signupController.dart';
import 'package:scstrade_pro/screens/onboard/BottomButton.dart';
import 'package:scstrade_pro/screens/signup/sign_up_screen.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});


  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  @override
  Widget build(BuildContext context) {
   Signupcontroller controller = context.read<Signupcontroller>();
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
              style: Theme.of(context).textTheme.bodyMedium),
            ),
          const Spacer(flex: 8,),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child:Consumer<Signupcontroller>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      value.counter==1?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                      value.counter==2?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                      value.counter==3?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                      value.counter==4?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
                      value.counter==5?Padding( padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/rectangle.svg")) : Padding(padding: const EdgeInsets.only(right: 8),child: SvgPicture.asset("images/circle.svg")),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage("images/logo.gif"), context);

  }
}



