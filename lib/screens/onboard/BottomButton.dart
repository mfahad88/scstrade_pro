import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';

import '../../widgets/my_button.dart';


class Bottombutton extends StatelessWidget {

  VoidCallback onPressedNext,onPressedPrevious;

  Bottombutton({super.key, required this.onPressedNext,required this.onPressedPrevious});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0,bottom: 25.0),
          child: MyButton(text: Appconstants.previous,
              textColor: const Color(0xFF12D18E),
              backgroundColor: const Color(0xFFE7FAF4),
              iconData: Icons.arrow_back,
              rtl: true,
              borderRadius: 10,onPressed: onPressedPrevious),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(right: 25.0,bottom: 25.0),
          child: MyButton(text: Appconstants.next,
              textColor: const Color(0xFFFFFFFF),
              backgroundColor: const Color(0xFF12D18E),
              iconData: Icons.arrow_forward,
              borderRadius: 10,onPressed: onPressedNext),
        )
      ],
    );
  }
}
