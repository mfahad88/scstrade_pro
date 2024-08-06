import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/signin_viewmodel.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/dashboard_screen.dart';
import 'package:scstrade_pro/widgets/heading_text.dart';
import 'package:scstrade_pro/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read<ThemeController>();
    SigninViewmodel viewmodel = context.read<SigninViewmodel>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: const HeadingText(Appconstants.hello_there),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text("Email",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500
                      )),
                    ),
                    Textfield(context, readOnly: false,keyboardType: TextInputType.emailAddress,onChanged: (value) => viewmodel.email),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Text("Password",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500
                      )),
                    ),
                    Textfield(context, readOnly: false,keyboardType: TextInputType.text,obscureText: true,onChanged: (value) => viewmodel.password),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));

                  },

                  child: const Text(Appconstants.continu),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
