import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

class Text10 extends StatelessWidget {
  final TextStyle? style;
  final String? data;
  const Text10 ({super.key,this.data,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data??'',
      style: style??TextStyle(
        color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
        fontSize: MediaQuery.of(context).size.width * 0.021,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
        height: 0.12,
      ),
    );
  }
}
