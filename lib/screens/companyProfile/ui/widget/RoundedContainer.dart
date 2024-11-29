import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/widgets/my_text.dart';

class RoundedContainer extends StatelessWidget {
  final String text1;
  final String text2;
  const RoundedContainer({super.key,required this.text1,required this.text2});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: ShapeDecoration(
          color: Utils.isDark(context)?Color(0xFF212121):Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(text1,
              textSize: 14,
              myStyle: TextStyle().copyWith(
                  color: Utils.isDark(context)?Colors.white:Color(0xFF3A3A3A)
              ),
            ),
            Spacer(),
            MyText(text2,
              textSize: 14,
              myStyle: TextStyle().copyWith(
                  color: text1=='Bid'?Color(0xFF1FAC53):text1=='Ask'?Color(0xFFE6263D):Utils.isDark(context)?Colors.white:Color(0xFF3A3A3A)
              ),
            )
          ],
        ),
      ),
    );
  }
}
