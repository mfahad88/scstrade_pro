import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartt extends StatelessWidget {
  const LineChartt({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true, drawHorizontalLine: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value) {
                  case 6.0:
                    return Text('6:00');
                  case 10.0:
                    return Text('10:00');
                  case 14.0:
                    return Text('14:00');
                  case 18.0:
                    return Text('18:00');
                  case 22.0:
                    return Text('22:00');
                  case 2.0:
                    return Text('2:00');
                }
                return Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(value.toString());
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        minX: 6,
        maxX: 24,
        minY: 192,
        maxY: 200,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(6, 194),
              FlSpot(10, 196),
              FlSpot(14, 198),
              FlSpot(18, 200),
              FlSpot(22, 196),
              FlSpot(2, 198), // Adjusted to create dashed effect
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.2),
            ),
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                if (spot.x == 22) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.black,
                    strokeWidth: 2,
                    strokeColor: Colors.green,
                  );
                }
                return FlDotCirclePainter(radius: 0);
              },
            ),
          ),
        ],
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(y: 198, color: Colors.grey.withOpacity(0.5))
        ]),
      ),
    );
  }
}
