import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mRoundedContainer extends StatelessWidget {
  final Widget child;
  final BorderSide? side;
  final Color color;
  final EdgeInsetsGeometry? padding;
  const mRoundedContainer({super.key, required this.child, this.side, required this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: side??const BorderSide(
              color: Colors.transparent
            ),
            borderRadius: BorderRadius.circular(8.r)
          )
      ),
      child: Center(child: child),
    );
  }
}
