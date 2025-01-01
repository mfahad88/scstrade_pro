import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/theme/theme.dart';

class mRoundedContainer extends StatelessWidget {
  final Widget child;
  final BorderSide? side;
  final Color color;
  const mRoundedContainer({super.key, required this.child, this.side, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 4),
      decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: side??const BorderSide(
              color: Colors.transparent
            ),
            borderRadius: BorderRadius.circular(12)
          )
      ),
      child: child,
    );
  }
}
