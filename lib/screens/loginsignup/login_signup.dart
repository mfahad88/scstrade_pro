import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/signup_controller.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/login/login_screen.dart';
import 'package:scstrade_pro/screens/signup/sign_up_screen.dart';
import 'package:scstrade_pro/widgets/google_button.dart';
import 'package:scstrade_pro/widgets/my_button.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      child: GoogleButton(onPressed: () => null,),
                    ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF12D18E),
                          foregroundColor: const Color(0xFFE7FAF4)
                      ),
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen())); },
                      child: const Text(Appconstants.sign_up),
                    ) ,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,top: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE7FAF4),
                          foregroundColor: const Color(0xFF12D18E)
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                      },
                      child: const Text(Appconstants.sign_in),
                    ) ,
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
