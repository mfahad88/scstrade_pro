import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/companypprofile_screen.dart';

import '../helper/Utils.dart';
import 'my_text.dart';

class StockRow extends StatelessWidget {
  final double width;
  final String symbol;
  final double volume;
  final String lowPrice;
  final String highPrice;
  final double closePrice;
  final double change;
  final double changePercentage;
  const StockRow({super.key,
    required this.width,
    required this.symbol,
    required this.volume,
    required this.lowPrice,
    required this.highPrice,
    required this.closePrice,
    required this.change,
    required this.changePercentage,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CompanypprofileScreen(),)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(12),
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
                MyText(symbol,textSize: 16,
                  myStyle: const TextStyle().copyWith(
                      color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                      fontWeight: FontWeight.w500
                  ),
                ),
                MyText('Vol: ${Utils.formatToMillions(volume)}',textSize: 12,
                  myStyle: const TextStyle().copyWith(
                      color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                      fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  children: [
                    MyText('L: ${lowPrice}',textSize: 12,
                      myStyle: const TextStyle().copyWith(
                          color: const Color(0xFFE6263D),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Gap(5),
                    MyText('H: ${highPrice}',textSize: 12,
                      myStyle: const TextStyle().copyWith(
                          color: const Color(0xFF1FAC53),
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(closePrice.toString(),textSize: 16,
                  myStyle: const TextStyle().copyWith(
                      color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                      fontWeight: FontWeight.w500
                  ),
                ),
                MyText(change.toString(),textSize: 12,
                  myStyle: const TextStyle().copyWith(
                      color: Utils.isDark(context)?const Color(0xFF737180):const Color(0xFF3A3A3A),
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            const Gap(8.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: ShapeDecoration(
                  color: changePercentage?.isNegative??false?Utils.isDark(context)?const Color(0xFF36191D):const Color(0xFFFEF4F5):Utils.isDark(context)?const Color(0XFF23372A):const Color(0xFFF4FBF6),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: changePercentage?.isNegative??false?const Color(0xFFE6263D): const Color(0xFF1FAC53),width: 0.4),
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
              child: MyText(changePercentage?.isNegative??false?'${Utils.roundTwoDecimal(changePercentage?.toDouble()??0.0)}%':'+${Utils.roundTwoDecimal(changePercentage?.toDouble()??0.0)}%',textSize: 16,
                myStyle: const TextStyle().copyWith(
                    color: changePercentage?.isNegative??false?Color(0xFFE6263D): Color(0xFF1FAC53),
                    fontWeight: FontWeight.w500
                ),),
            )
          ],
        ),
      ),
    );
  }
}
