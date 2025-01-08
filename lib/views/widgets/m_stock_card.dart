import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/views/widgets/line_chart_sample.dart';

class mStockCard extends StatelessWidget {
  final StockCardData stockCardData;
  const mStockCard({super.key, required this.stockCardData, });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: ShapeDecoration(
        color: Utils.isDark(context)?MaterialTheme.lightScheme().onSurface:Color(0xFFFCF8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.r,left: 10.r,right: 10.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    /*constraints: BoxConstraints(
                      maxWidth: 40.r,
                    ),*/
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 26.r,
                          height: 26.r,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(stockCardData.image??''),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        Gap(5.r),
                        if(stockCardData.index?.toLowerCase().contains('kmi')??false)
                          Container(
                            width: 26.r,
                            height: 8.r,
                            decoration: ShapeDecoration(
                              color: Color(0xFF4EB536),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                            child: Text(
                              'Sariah',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 6,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                          ),


                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                  /*  constraints: BoxConstraints(
                        maxWidth: 120.r,
                    ),*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stockCardData.symbol??"",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w600,
                            height: 1.33,
                            letterSpacing: 0.67,
                          ),
                        ),
                        Text(
                          stockCardData.name??"",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: Utils.isDark(context)?Colors.white:Color(0xFF484646),
                            fontWeight: FontWeight.w400,
                            height: 2.0,
                            letterSpacing: -0.11,
                          ),
                        ),

                        Text(
                          'Vol: ${Utils.commaSeparated(stockCardData.volume)}',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:Color(0xFF0C5300),
                            fontWeight: FontWeight.w500,
                            height: 1.60,
                            letterSpacing: -0.10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    /*constraints: BoxConstraints(
                        maxWidth: 90.r,
                    ),*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${stockCardData.closingPrice}'??"",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:Color(0xFF136E00),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.67,
                            height: 1.33,
                          ),
                        ),

                        Text(
                          '${stockCardData.changeValue} (${Utils.roundTwoDecimal(double.parse(stockCardData.changePercent??"0.0"))}%)',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Color(0xFF484646),
                            fontWeight: FontWeight.w400,
                            height: 2,
                            letterSpacing: -0.11,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                width: 8.r,
                                height: 6.55.r,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF910000),
                                  shape: StarBorder.polygon(sides: 3),
                                ),
                              ),
                            ),
                            Text(
                              'L: ${stockCardData.low}',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Color(0xFF910000),
                                fontWeight: FontWeight.w500,
                                height: 2.40,
                                letterSpacing: -0.20,
                              ),
                            ),
                            Container(
                              width: 8.r,
                              height: 6.55.r,
                              decoration: ShapeDecoration(
                                color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:Color(0xFF136E00),
                                shape: StarBorder.polygon(sides: 3),
                              ),
                            ),
                            Text(
                              'H: ${stockCardData.high}',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:Color(0xFF136E00),
                                fontWeight: FontWeight.w500,
                                height: 2.40,
                                letterSpacing: -0.20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Gap(5.r),
                Expanded(
                  flex: 1,
                  child: Container(

                    constraints: BoxConstraints(
                        maxWidth: 50.r,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 60.r,
                        maxHeight: 42.r,
                      ),
                      child: LineChartSample(spots: stockCardData.spots!),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 23.r,
            decoration: ShapeDecoration(
              color: Utils.isDark(context)?MaterialTheme.lightHighContrastScheme().onSurfaceVariant:Color(0xFFF4F0EF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stockCardData.askPrice??"",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color(0xFF435E91),
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                    letterSpacing: -0.12,
                  ),
                ),
                Gap(18.r),
                Text(
                  stockCardData.askVolume??"",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color(0xFF435E91),
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                    letterSpacing: -0.12,
                  ),
                ),
                Gap(18.r),
                Text(
                  stockCardData.bidPrice??"",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color(0xFFA44FA9),
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                    letterSpacing: -0.12,
                  ),
                ),
                Gap(18.r),
                Text(
                  stockCardData.bidVolume??"",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color(0xFFA44FA9),
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                    letterSpacing: -0.12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
