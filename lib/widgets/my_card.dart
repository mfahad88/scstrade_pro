import 'package:flutter/material.dart';

import '../helper/Utils.dart';

class MyCard extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  Color? surfaceTintColor;
  Color? shadowColor;
  MyCard({super.key,this.child,this.width,this.height,this.surfaceTintColor,this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card.outlined(
        surfaceTintColor: surfaceTintColor,
        shadowColor: shadowColor,
        color: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white,
        margin: EdgeInsets.zero,

        elevation: 5.0,

        child: child,
      ),
    );
  }
}
