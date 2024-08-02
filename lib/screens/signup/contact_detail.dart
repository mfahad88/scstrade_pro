import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/signup_controller.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/widgets/heading_text.dart';
import 'package:scstrade_pro/widgets/sub_heading_text.dart';
import 'package:scstrade_pro/widgets/text_field.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller=context.read<SignupController>();
    ThemeController themeController=context.read<ThemeController>();
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(Appconstants.contact_detail),

            Container(margin:const EdgeInsets.only(top: 20),child:  Text("Email",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700
            ),)),
            Textfield(
              keyboardType: TextInputType.emailAddress,
              context,
              readOnly: false,
              // controller: controller.textEditingControllerCompany,
              onChanged: (value) => {
                controller.email=value
              },
            ),
            Container(margin:const EdgeInsets.only(top: 30),child:  Text("Phone",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700
            ),)),
            Expanded(
              child: Textfield(
                keyboardType: TextInputType.phone,
                context,
                readOnly: false,
                // controller: controller.textEditingControllerCompany,
                onChanged: (value) => {
                  controller.phone=value
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
