import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/signup_controller.dart';
import 'package:scstrade_pro/widgets/heading_text.dart';
import 'package:scstrade_pro/widgets/sub_heading_text.dart';
import 'package:scstrade_pro/widgets/text_field.dart';

import '../../helper/AppConstants.dart';

class YourNameScreen extends StatelessWidget {
  const YourNameScreen({super.key});

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
            child: const HeadingText(Appconstants.what_is_your),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: const SubHeadingText(Appconstants.full_name),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Textfield(
                context,
                readOnly: false,
                onChanged: (value) {
                  context.read<SignupController>().fullName = value;
                }),
            ),
          )
        ],
      ),
    );
  }
}

