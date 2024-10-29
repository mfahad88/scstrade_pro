import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_one.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_two.dart';
import 'package:scstrade_pro/screens/intro/viewmodel/intro_viewmodel.dart';

import 'intro_three.dart';

class IntroScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/bg_light.png'),fit: BoxFit.fill)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Consumer<IntroViewModel>(
              builder: (BuildContext context, IntroViewModel provider, Widget? child) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: provider.controller,
                        itemCount: provider.isViewed.length,
                        itemBuilder: (context, index) {
                        if(index==0){
                          return IntroOne();
                        }else if(index==1){
                          return IntroTwo();
                        }else if(index==2){
                          return IntroThree();
                        }
                      },),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                              color: provider.isViewed[0]?Color(0xFF2CE52F):Color(0xFFE1E1E1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        Gap(10.0),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                              color: provider.isViewed[1]?Color(0xFF2CE52F):Color(0xFFE1E1E1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        Gap(10.0),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                              color: provider.isViewed[2]?Color(0xFF2CE52F):Color(0xFFE1E1E1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        )
                      ],
                    ),
                    Gap(50),
                    GestureDetector(
                      onTap: () {
                        if(provider.count<provider.isViewed.length-1) {
                          provider.count = provider.count + 1;
                        }
                        provider.isViewed[provider.count]=true;
                        /*if(provider.count==1){
                          provider.isViewed[1]=true;
                        }else if(provider.count==2){
                          provider.isViewed[2]=true;
                        }
                        else if(provider.count==2){
                          provider.isViewed[2]=true;
                        }*/
                        provider.controller.animateToPage(provider.count, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                      },
                      child: Container(
                        width: 368,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: ShapeDecoration(
                          color: Color(0xFF2CE52F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 20,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      provider.count<provider.isViewed.length-1?'Next':'Get Started',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w600,
                                        height: 0.08,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(24),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an Account? ',
                            style: TextStyle(
                              color: Color(0xFF1D1D1D),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.28,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Color(0xFF2CE52F),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(24),
                  ],
                );
              },

            ),
          )
        ),
      ),
    );
  }
}