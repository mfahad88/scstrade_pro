import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/widgets/my_card.dart';

class MyWishlist extends StatelessWidget {
  const MyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
        children:  [
          MyCard(
            width: 150,
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(
                        "DOW",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                      ),
                    )

                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "+ 3.57%",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF12D18E),
                      ),
                      ),
                    )

                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                        maxHeight: 140,
                        minHeight: 100,
                        maxWidth: 150,
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
                            spots: [
                              const FlSpot(0, 5),
                              const FlSpot(1, 3.5),
                              const FlSpot(2, 4),
                              const FlSpot(3, 3),
                              const FlSpot(4, 4),
                              const FlSpot(5, 5)
                            ],
                            isCurved: false,
                            color: const Color(0xFF12D18E),
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          MyCard(
            width: 150,
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(
                        "S&P 500",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                      ),
                    )

                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "- 1.96%",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF75555),
                      ),
                      ),
                    )

                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                        maxHeight: 140,
                        minHeight: 100,
                        maxWidth: 150,
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
                            spots: [
                              const FlSpot(0, 5),
                              const FlSpot(1, 3.5),
                              const FlSpot(2, 4),
                              const FlSpot(3, 3),
                              const FlSpot(4, 4),
                              const FlSpot(5, 5)
                            ],
                            isCurved: false,
                            color: const Color(0xFFF75555),
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          MyCard(
            width: 150,
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10,top: 5),
                      child: Text(
                        "NASDAQ",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                      ),
                    )

                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "+ 2.85%",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF12D18E),
                      ),
                      ),
                    )

                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                        maxHeight: 140,
                        minHeight: 100,
                        maxWidth: 150,
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
                            spots: [
                              const FlSpot(0, 5),
                              const FlSpot(1, 3.5),
                              const FlSpot(2, 4),
                              const FlSpot(3, 3),
                              const FlSpot(4, 4),
                              const FlSpot(5, 5)
                            ],
                            isCurved: false,
                            color: const Color(0xFF12D18E),
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
