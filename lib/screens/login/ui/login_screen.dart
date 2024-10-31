import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../helper/Utils.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: Utils.isDark(context)?const AssetImage('images/bg_dark.png'):const AssetImage('images/bg_light.png'),fit: BoxFit.fill)
            )
        ),
        LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Gap(21),
                  Image.asset('images/scs_logo.png'),
                  Text('SCS Trade Pro',style: Theme.of(context).textTheme.headlineSmall,),
                ],
              );
            },
        ),
      ],
    );
  }
}
