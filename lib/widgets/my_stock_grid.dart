import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/models/MyStock.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class MyStockGrid extends StatelessWidget {
  final List<MyStock>? list;
  const MyStockGrid({super.key,this.list});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,

      itemCount: list?.length,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
        child: Row(
          children: [
            Image.asset(list![index].image),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:100,
                        child: Text(list![index].title,
                            overflow: TextOverflow.ellipsis,maxLines: 1,
                            style: themeController.themeData.textTheme.bodyLarge)
                    ),
                    Text(list![index].shortName)
                  ],
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                  minWidth: 72,
                  maxWidth: 72,
                  minHeight: 32,
                  maxHeight: 32
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
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(list![index].totalAmount,style: themeController.themeData.textTheme.bodyLarge!.copyWith(
                          fontSize: 18
                        ),),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(list![index].profitLoss,style: themeController.themeData.textTheme.bodySmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555)
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    },
    );
  }
}
