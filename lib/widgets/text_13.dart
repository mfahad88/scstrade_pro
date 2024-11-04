import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

class Text13 extends StatelessWidget {
  final TextStyle? style;
  final String? data;
  const Text13({super.key,this.data,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data??'',
      style: style?? TextStyle(
        color: Utils.isDark(context)?const Color(0xFF2CE52F):const Color(0xFF1D1D1D),
        fontSize: MediaQuery.of(context).size.width * 0.027,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w600,
        height: 0.09,
      ),
    );
  }
}
