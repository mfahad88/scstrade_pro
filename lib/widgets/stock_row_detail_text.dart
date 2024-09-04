import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockRowDetailText extends StatelessWidget {
  final String title;
  final Color? color;
  const StockRowDetailText({super.key,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Text('$title',
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      softWrap: true,
      style: TextStyle(
        color: color ?? Color(0xFF898989),
        fontSize: 10,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
