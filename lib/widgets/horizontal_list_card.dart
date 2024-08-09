import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

import '../helper/Utils.dart';
import '../models/MyStock.dart';
import 'my_card.dart';

class HorizontalListCard extends StatelessWidget {
  final List<MyStock>? list;
  final double? width;
  final double? height;
  const HorizontalListCard({super.key,this.list,this.width, this.height});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return ListView.builder(
      clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index<2?5:0),
            child: MyCard(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10,top: 5),
                        child: Text(
                          list![index].shortName,style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Utils.isDark(context)?Colors.white:const Color(0xFF1F222A)
                        ),
                        ),
                      )

                  ),
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          list![index].profitLoss,style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555),
                        ),
                        ),
                      )

                  ),
                  Expanded(
                    child: Container(
                      // margin: const EdgeInsets.only(left: 1,right: 1,bottom: 20),
                      constraints: const BoxConstraints(
                          maxHeight: 140,
                          minHeight: 100,
                          maxWidth: 120,
                          minWidth: 90
                      ),
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          minY: 0,
                          maxX: 5,
                          maxY: 5,
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: list![index].spots,
                              isCurved: false,
                              color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555),
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                  show: false,
                                  color: list![index].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}
