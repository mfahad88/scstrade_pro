import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

class Text14 extends StatelessWidget {
  final TextStyle? style;
  final String? data;
  const Text14({super.key,this.data,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data??'',
      style: style??TextStyle(
        color: Utils.isDark(context)?Colors.white:Color(0xFF222230),
        fontSize: MediaQuery.of(context).size.width * 0.029,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}
