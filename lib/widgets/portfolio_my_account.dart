import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class PortfolioMyAccount extends StatelessWidget {
  final String? assetName;
  final String? title;
  final String? amount;
  const PortfolioMyAccount({super.key,this.title,this.amount,this.assetName});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 0,top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(assetName!),
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!,style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: const Color(0XFF757575)
                )),
                Text(amount!,style: themeController.themeData.textTheme.bodyLarge!.copyWith(
                  fontSize: 14
                ),textAlign: TextAlign.left,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
