import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/controller/theme_controller.dart';

import '../AppConstants.dart';
import '../controller/signup_controller.dart';
import '../views/heading_text.dart';
import '../views/sub_heading_text.dart';
import '../views/text_field.dart';

class WhatDoYouDo extends StatelessWidget {
  const WhatDoYouDo({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller=context.read();
    ThemeController themeController = context.read();
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              text: Appconstants.what_do_you_do,
              style: themeController.themeData.textTheme.headlineLarge,
              children:[
                TextSpan(
                text: ' ${controller.company} 💼',
                style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                  color: const Color(0xFF12D18E)
                ),)
              ]
            )),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: const SubHeadingText(Appconstants.your_occuption),
            ),
            Expanded(
              child: Textfield(
                keyboardType: TextInputType.text,
                context,
                readOnly: false,
                controller: controller.textEditingControllerOccuption,
                onChanged: (value) => {
                  controller.occuption=controller.textEditingControllerOccuption.text
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}