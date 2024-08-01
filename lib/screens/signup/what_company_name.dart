import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/signup_controller.dart';
import 'package:scstrade_pro/widgets/heading_text.dart';
import 'package:scstrade_pro/widgets/sub_heading_text.dart';
import 'package:scstrade_pro/widgets/text_field.dart';

class WhatCompanyName extends StatelessWidget {
  const WhatCompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller=context.read<SignupController>();
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(Appconstants.the_company_name),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(Appconstants.regulation_required),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: const SubHeadingText(Appconstants.company_name),
            ),
            Expanded(
              child: Textfield(
                keyboardType: TextInputType.text,
                context,
                readOnly: false,
                // controller: controller.textEditingControllerCompany,
                onChanged: (value) => {
                  controller.company=value
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
