import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'my_text.dart';

class mChip extends StatelessWidget {
  final String? changePercent;
  final String? changeValue;
  const mChip({super.key,this.changePercent,this.changeValue});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      decoration: ShapeDecoration(
        color: changeValue!.contains('-')?Color(0x1AFEF4F5):Color(0x1AF4FBF6),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,color: changeValue!.contains('-')?Color(0XFFE6263D):Color(0xFF1FAC53),
            ),
            borderRadius: BorderRadius.circular(12)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
        child:Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(changeValue!.contains('-')?Icons.arrow_downward:Icons.arrow_upward,color: changeValue!.contains('-')?Color(0XFFE6263D):Color(0xFF1FAC53),size: width*10/480,),
            MyText(changePercent,textSize: 10,),
            Gap(4),
            MyText(changeValue?.contains('-')??false?changeValue:'+$changeValue',textSize: 10,)
          ],
        ),
      ),
    );

  }
}
