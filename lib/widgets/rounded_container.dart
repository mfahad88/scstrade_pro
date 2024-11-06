import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

class RoundedContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  const RoundedContainer({super.key,this.width,this.height,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
          color: Utils.isDark(context)?const Color(0xFF212121):Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1,color: Utils.isDark(context)?const Color(0xFF2D2D2D):const Color(0xFFE1E1E1)),
            borderRadius: BorderRadius.circular(12),
          )
      ),
      child: child,
    );
  }
}
