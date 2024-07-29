import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppConstants.dart';
import '../controller/signupController.dart';
import '../views/heading_text.dart';
import '../views/sub_heading_text.dart';
import '../views/text_field.dart';

class WhereYouBorn extends StatelessWidget {
  const WhereYouBorn({super.key});

  @override
  Widget build(BuildContext context) {
    Signupcontroller controller=context.read<Signupcontroller>();
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(Appconstants.where_yor_born),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: const SubHeadingText(Appconstants.place_of_birth),
            ),
            Expanded(
              child: Textfield(
                keyboardType: TextInputType.streetAddress,
                context,
                readOnly: false,
                controller: controller.textEditingControllerPob,
                onChanged: (value) => {
                  controller.pob=controller.textEditingControllerPob.text
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
