import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

import '../../../../widgets/my_text.dart';

class Expandedtile extends StatelessWidget {
  final String title;
  final List<Widget> body;
  const Expandedtile({super.key,required this.title,required this.body});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: Color(0xFFF5F5F5),
              width: 1
          )
      ),
      title: MyText(title,textSize: 16,
      myStyle: TextStyle().copyWith(
        color: Utils.isDark(context)? Color(0xFF2CE52F):Color(0xFF0B4702)
      ),),
      children: body,);
  }
}
