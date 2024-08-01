import 'package:flutter/material.dart';

class CirclePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..color = const Color(0xFFE0E0E0);
      canvas.drawCircle(const Offset(0, 0), 5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}