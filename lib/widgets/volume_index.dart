import 'package:flutter/material.dart';

import '../helper/Utils.dart';
import 'my_text.dart';

class VolumeIndex extends StatelessWidget {
  final String? data;
  final double? textSize;
  final TextStyle? style;
  const VolumeIndex(this.data,{super.key,this.textSize,this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.arrow_drop_up,color: Color(0xFF2CE52F),),
        MyText(data,textSize: textSize,myStyle: style)
      ],
    );
  }
}
