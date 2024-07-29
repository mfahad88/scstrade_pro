import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/controller/signupController.dart';
import 'package:scstrade_pro/screens/views/heading_text.dart';
import 'package:scstrade_pro/screens/views/radio_btn.dart';

import '../AppConstants.dart';

class WhatIsGender extends StatelessWidget {
  const WhatIsGender({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const HeadingText(Appconstants.what_is_gender),
          ),
          Container(
            child: Consumer<Signupcontroller>(
              builder: (BuildContext context, Signupcontroller controller, Widget? child) {
                return Column(
                  children: [
                    RadioBtn(title: "Male",groupValue: controller.gender, onChanged: (p0) => controller.gender=p0),
                    RadioBtn(title: "Female",groupValue: controller.gender, onChanged: (p0) => controller.gender=p0),
                  ],
                );
              },

            ),
          )

        ],
      ),
    );
  }
}
