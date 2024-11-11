import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/data/dto/kse_indices.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/widgets/my_text.dart';
import 'package:scstrade_pro/widgets/rounded_container.dart';
import 'package:scstrade_pro/widgets/volume_index.dart';

import '../../../../widgets/chip.dart';

class CardIndex extends StatelessWidget {
  final KseIndices kse;
  const CardIndex(this.kse, {super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double currentIndex=double.parse(kse.currentIndex??'0.0');
    double preClose=kse.preClose??0.0;
    String percentageChange=currentIndex.compareTo(0.0)!=0?'${Utils.roundTwoDecimal(((currentIndex-preClose)/preClose*100))}%':'0.0%';
    String netChange=Utils.roundTwoDecimal(currentIndex-preClose).contains('-')?'-':'+'+Utils.roundTwoDecimal(currentIndex-preClose);
    print('$percentageChange $netChange');
    return RoundedContainer(
      width: width*150/480,
      // height: width*106/480,*/
      child: Padding(
        padding: EdgeInsets.all(width*10/480),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(kse.indexCode,
              textSize: 14,
              myStyle: TextStyle().copyWith(
                  color: Utils.isDark(context)?Color(0xFFC7C7CC):Color(0XFFF222230),
                  fontWeight: FontWeight.w400
              ),
            ),
            VolumeIndex(
              Utils.formatToMillions(double.parse(kse.volumeTraded??'0.0')),
              textSize: 20,
              style: TextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  color: Utils.isDark(context)?Colors.white:Color(0xFF222230)
              ),
            ),

            mChip(
              changePercent: percentageChange,
              changeValue: netChange,
            ),

          ],
        ),
      ),
    );
  }
}
