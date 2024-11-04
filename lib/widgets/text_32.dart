import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

class Text32 extends StatelessWidget {
  final TextStyle? style;
  final String? data;
  const Text32({super.key,this.data,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data??'',
      style: style??TextStyle(
        color: Utils.isDark(context)?Colors.white: const Color(0xFF222230),
        fontSize: MediaQuery.of(context).size.width * 0.066,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    );
  }
}
