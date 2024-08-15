import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class RowKeyValue extends StatelessWidget {
  final String keys;
  final String value;
  final TextStyle? textStyle;
  const RowKeyValue(this.keys,this.value,{super.key,this.textStyle});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return  Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(keys,
              style: textStyle ?? themeController.themeData.textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.grey.shade500
              ),
            ),
            Text(value,
              style: textStyle ?? themeController.themeData.textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  color: const Color(0xFF212121)
              ),
            )
          ],
        ),
      ),
    );
  }
}
