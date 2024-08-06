import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class HeadingWithArrow extends StatelessWidget {
  final String title;
  const HeadingWithArrow({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title,style: themeController.themeData.textTheme.headlineMedium))),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            alignment: Alignment.centerRight,
            child: const Icon(Icons.arrow_forward,color: Color(0xFF12D18E)),),
        )

      ],
    );
  }
}
