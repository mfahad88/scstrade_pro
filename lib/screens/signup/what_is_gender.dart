import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/signup/signupController.dart';

import '../AppConstants.dart';

class WhatIsGender extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Signupcontroller>(
      builder: (BuildContext context, Signupcontroller controller, Widget? child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(Appconstants.what_is_gender,
                    style: Theme.of(context).textTheme.headlineLarge
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Male"),
                      leading: Radio<String>(
                        value: "Male",
                        groupValue: controller.gender,
                        onChanged: (value) => controller.gender=value!,
                      ),
                    ),
                    ListTile(
                      title: Text("Female"),
                      leading: Radio<String>(
                        value: "Female",
                        groupValue: controller.gender,
                        onChanged: (value) => controller.gender=value!,
                      ),
                    )
                  ],
                ),
              )
          
            ],
          ),
        );
      },

    );
  }
}
