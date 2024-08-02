import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/AppConstants.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const GoogleButton({super.key,this.onPressed});

  @override
  Widget build(BuildContext context) {

    var themeController=context.read<ThemeController>();
    return OutlinedButton(onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 2,
              color: Color(0xffEEEEEE)
            )
        )
        ,child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage("images/google_icon.png"),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(Appconstants.continue_with_google,style: themeController.themeData.textTheme.bodyMedium)
      ],
    ),
    );
  }
}
