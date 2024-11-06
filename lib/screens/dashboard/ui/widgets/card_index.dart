import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/widgets/my_text.dart';
import 'package:scstrade_pro/widgets/rounded_container.dart';
import 'package:scstrade_pro/widgets/volume_index.dart';

import '../../../../widgets/chip.dart';

class CardIndex extends StatelessWidget {
  const CardIndex({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return RoundedContainer(
      width: width*176/480,
      // height: width*106/480,*/
      child: Padding(
        padding: EdgeInsets.all(width*10/480),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText('KSE 100',
              textSize: 14,
              myStyle: TextStyle().copyWith(
                  color: Utils.isDark(context)?Color(0xFFC7C7CC):Color(0XFFF222230),
                  fontWeight: FontWeight.w400
              ),
            ),
            VolumeIndex(
              '86,466.57',
              textSize: 20,
              style: TextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  color: Utils.isDark(context)?Colors.white:Color(0xFF222230)
              ),
            ),

            mChip(
              changePercent: '0.47%',
              changeValue: '+409.06',
            ),

          ],
        ),
      ),
    );
  }
}
