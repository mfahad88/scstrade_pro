import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppConstants.dart';
import '../controller/signupController.dart';
import '../views/heading_text.dart';
import '../views/radio_btn.dart';

class WhatYouDoInvestment extends StatelessWidget {
  const WhatYouDoInvestment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const HeadingText(Appconstants.what_is_gender),
          ),
          Expanded(
            child: Consumer<Signupcontroller>(
              builder: (BuildContext context, Signupcontroller controller, Widget? child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                  
                    children: [
                      RadioBtn(title: "I want to grow my capital",groupValue: controller.living, onChanged: (p0) => controller.living=p0),
                      RadioBtn(title: "I want to speculate",groupValue: controller.living, onChanged: (p0) => controller.living=p0),
                      RadioBtn(title: "I want to hedge",groupValue: controller.living, onChanged: (p0) => controller.living=p0),
                      RadioBtn(title: "I want to learn investments",groupValue: controller.living, onChanged: (p0) => controller.living=p0),
                      RadioBtn(title: "I still don't know for sure",groupValue: controller.living, onChanged: (p0) => controller.living=p0),
                    ],
                  ),
                );
              },

            ),
          )

        ],
      ),
    );
  }
}
