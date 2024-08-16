import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class ChartTypeSelection extends StatelessWidget {
  final bool isSelected;
  final GestureTapCallback onTap;
  final String title;
  const ChartTypeSelection({super.key,required this.title,required this.isSelected,required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read();
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 40,
        // height: 20,
        decoration: BoxDecoration(
            color: isSelected? Colors.green.shade500:Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: isSelected ?  Colors.transparent:Colors.black,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(child: Text(title,
            style: themeController.themeData.textTheme.headlineSmall!.copyWith(
                fontSize: 10,
                color: isSelected ? Colors.white : Colors.black
            ),
          ),
          ),
        ),
      ),

    );
  }
}
