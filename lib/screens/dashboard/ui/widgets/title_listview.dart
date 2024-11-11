import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/data/dto/Index_group.dart';

import '../../../../helper/Utils.dart';
import '../../../../widgets/my_text.dart';

class TitleListview extends StatelessWidget {
  final double width;
  final String? title;
  final List<IndexGroup> indexGroups;
  const TitleListview({super.key,required this.width,this.title,required this.indexGroups});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(title,textSize: 20,
          myStyle: const TextStyle().copyWith(
              color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C),
              fontWeight: FontWeight.w400
          ),
        ),
        const Gap(2.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: indexGroups.length,
          itemBuilder: (context, index) {
            IndexGroup indexGroup=indexGroups[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Utils.isDark(context)?const Color(0XFF212121):Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: Utils.isDark(context)?const Color(0xFF2D2D2D):const Color(0xFFE1E1E1)
                    )
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterLogo(
                    size: width * 44/480,
                  ),
                  const Gap(4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(indexGroup.symbol,textSize: 16,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Container(
                        width: 100,
                        child: MyText(indexGroup.name,textSize: 12,
                          myStyle: const TextStyle().copyWith(
                              color: Utils.isDark(context)?const Color(0xFF737180):const Color(0xFF3A3A3A),
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MyText(indexGroup.closePrice.toString(),textSize: 16,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      MyText(indexGroup.change.toString(),textSize: 12,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?const Color(0xFF737180):const Color(0xFF3A3A3A),
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  Gap(8.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: ShapeDecoration(
                      color: indexGroup.changePercentage?.isNegative??false?Utils.isDark(context)?Color(0xFF36191D):Color(0xFFFEF4F5):Utils.isDark(context)?Color(0XFF23372A):Color(0xFFF4FBF6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: indexGroup.changePercentage?.isNegative??false?Color(0xFFE6263D): Color(0xFF1FAC53),width: 0.4),
                          borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: MyText(indexGroup.changePercentage?.isNegative??false?'${Utils.roundTwoDecimal(indexGroup.changePercentage?.toDouble()??0.0)}%':'+${Utils.roundTwoDecimal(indexGroup.changePercentage?.toDouble()??0.0)}%',textSize: 16,
                    myStyle: TextStyle().copyWith(
                      color: indexGroup.changePercentage?.isNegative??false?Color(0xFFE6263D): Color(0xFF1FAC53),
                      fontWeight: FontWeight.w500
                    ),),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
