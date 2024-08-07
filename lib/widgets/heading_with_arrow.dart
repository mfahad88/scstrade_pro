import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class HeadingWithArrow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HeadingWithArrow({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Row(

      children: [
        Text(title,style: themeController.themeData.textTheme.headlineMedium),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Color(0xFF12D18E)), onPressed: onPressed,

        )

      ],
    );
  }
}
