import 'package:flutter/material.dart';

class StockBlueText extends StatelessWidget {
  final String? title;
  final Color? color;
  const StockBlueText({super.key,this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Text('$title',
      style: TextStyle(
          color: color ?? Color(0xFF455A87),
          fontSize: 14,
          fontWeight: FontWeight.w600
      ),
    );
  }
}
