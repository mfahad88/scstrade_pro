import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/signup/signupController.dart';

import '../AppConstants.dart';

class YourNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Signupcontroller>(
      builder: (BuildContext context, Signupcontroller controller, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(Appconstants.what_is_your,
                  style: Theme.of(context).textTheme.headlineLarge
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text(
                Appconstants.full_name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: Theme.of(context).textTheme.headlineMedium,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  controller.setFullName=value;
                },

              ),
            )
          ],
        );
      },

    );
  }
}

