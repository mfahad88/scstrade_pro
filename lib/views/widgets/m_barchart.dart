import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class mBarChart extends StatelessWidget {
  final int x;
  final double y;
  final double width;
  const mBarChart({super.key, required this.x, required this.y, required this.width});

  @override
  Widget build(BuildContext context) {
    return BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: x,
              barRods: [
                BarChartRodData(
                    toY: y,
                  width:width,

                )
              ]
            )
          ]
        ),
    );
  }
}
