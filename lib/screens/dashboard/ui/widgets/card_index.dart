import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/widgets/my_text.dart';

class CardIndex extends StatelessWidget {
  const CardIndex({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      width: width*176/480,
      height: width*106/480,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(width*12/480),
      decoration: ShapeDecoration(
        color: Utils.isDark(context)?Color(0xFF212121):Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color:  Color(0xFF2D2D2D)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_drop_up,color: Color(0xFF2CE52F),),
              MyText('86,466.57',textSize: 20,myStyle: TextStyle().copyWith(
                fontWeight: FontWeight.w500,
                color: Utils.isDark(context)?Colors.white:Color(0xFF222230)
              ),)
            ],
          ),
          Container(
            decoration: ShapeDecoration(
                color: Color(0xFFF4FBF6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,color: Color(0xFF1FAC53),
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_upward,color: Color(0xFF1FAC53),size: width*10/480,),
                  MyText('0.47%',textSize: 10,),
                  Gap(4),
                  MyText('+409.06',textSize: 10,)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
