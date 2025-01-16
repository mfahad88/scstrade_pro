import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mRoundedContainer extends StatelessWidget {
  final Widget child;
  final BorderSide? side;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  const mRoundedContainer({super.key, required this.child, this.side, required this.color, this.padding, this.borderRadius, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: side??const BorderSide(
              color: Colors.transparent
            ),
            borderRadius: borderRadius??BorderRadius.circular(8.r)
          )
      ),
      child: Center(child: child),
    );
  }
}
