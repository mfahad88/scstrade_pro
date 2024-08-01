import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/signup_controller.dart';
import 'package:scstrade_pro/widgets/heading_text.dart';
import 'package:scstrade_pro/widgets/radio_btn.dart';


class AreYouSaving extends StatelessWidget {
  const AreYouSaving({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const HeadingText(Appconstants.are_you_saving),
          ),
          Expanded(
            child: Consumer<SignupController>(
              builder: (BuildContext context, SignupController controller, Widget? child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(

                    children: [
                      RadioBtn(title: "Yes",groupValue: controller.saving, onChanged: (p0) => controller.saving=p0),
                      RadioBtn(title: "No",groupValue: controller.saving, onChanged: (p0) => controller.saving=p0),
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
