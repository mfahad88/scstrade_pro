import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class OvalPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
        ..shader=ui.Gradient.linear(const Offset(32, 8), const Offset(14.3978, -12.4144), [const Color(0xFF12D18E),const Color(0xFF71E3BB)]);
    Rect rect =  const Rect.fromLTWH(0, 0, 35, 12);
    canvas.drawRRect(ui.RRect.fromRectAndRadius(rect, const ui.Radius.circular(7)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}