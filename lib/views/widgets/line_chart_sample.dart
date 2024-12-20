import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/theme.dart';

import '../../helper/Utils.dart';

class LineChartSample extends StatelessWidget {
  final List<FlSpot> spots;

  const LineChartSample({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 5,
        minY: 0,
        maxY: 5,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false, border: Border.all(color: Colors.black, width: 1)),
        lineBarsData: [
          LineChartBarData(
            spots:spots,
            curveSmoothness: 0.5,
            show: true,
            isCurved: true,
            color: Utils.isDark(context)?MaterialTheme.darkScheme().primary:MaterialTheme.lightScheme().primary,
            barWidth: 1,
            belowBarData: BarAreaData(show: true,/* color: Colors.blue.withOpacity(0.3)*/
            gradient: LinearGradient(colors: Utils.isDark(context)?[MaterialTheme.darkScheme().primary.withOpacity(1.0),MaterialTheme.darkScheme().primary.withOpacity(0.1)]:[MaterialTheme.lightScheme().primary.withOpacity(1.0),MaterialTheme.lightScheme().primary.withOpacity(0.1)])),
          ),
        ],
      ),
    );
  }
}