import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

import '../models/MyStock.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
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
            spots: Utils.getStocks(7)[0].spots,
            isCurved: false,
            color: const Color(0xFF12D18E),
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: false,
              color: const Color(0x1A12D18E),
            ),
          ),
        ],
      ),
    );
  }
}
