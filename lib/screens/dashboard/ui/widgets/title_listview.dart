import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/widgets/stock_row.dart';

import '../../../../data/dto/Stock_data.dart';
import '../../../../helper/Utils.dart';
import '../../../../widgets/my_text.dart';

class TitleListview extends StatelessWidget {
  final double width;
  final String? title;
  final List<StockData> indexGroups;
  const TitleListview({super.key,required this.width,this.title,required this.indexGroups});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title?.isNotEmpty??false,
          child: MyText(title,textSize: 20,
            myStyle: const TextStyle().copyWith(
                color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C),
                fontWeight: FontWeight.w400
            ),
          ),
        ),
        const Gap(2.0),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: indexGroups.length,
          itemBuilder: (context, index) {
            StockData indexGroup=indexGroups[index];
            return StockRow(width: width,
                symbol: indexGroup.sym??'',
                volume: indexGroup.v?.toDouble()??0.0,
                lowPrice: indexGroup.lp.toString(),
                highPrice: indexGroup.hp.toString(),
                closePrice: indexGroup.cl?.toDouble()??0.0,
                change: indexGroup.ch?.toDouble()??0.0,
                changePercentage: indexGroup.chp?.toDouble()??0.0);
          },
        )
      ],
    );
  }
}
