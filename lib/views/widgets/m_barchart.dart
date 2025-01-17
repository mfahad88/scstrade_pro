import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mBarChart extends StatelessWidget {
  final Map<String,BarChartGroupData> performance;
  final double maxY;
  final double reservedLeftSize;
  final double reservedBottomSize;
  final FlGridData gridData;
  final BuildContext context;
  final AxisTitles? rightTitles;
  final AxisTitles? leftTitles;
  const mBarChart({super.key, required this.performance, required this.maxY, required this.reservedLeftSize, required this.reservedBottomSize, required this.gridData, required this.context, this.rightTitles, this.leftTitles});

  @override
  Widget build(BuildContext _) {
    return BarChart(
      BarChartData(
        maxY: maxY,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false)
          ),
          rightTitles: rightTitles??AxisTitles(
              sideTitles: SideTitles(showTitles: false)
          ),
          leftTitles: leftTitles??AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: reservedLeftSize,
              getTitlesWidget: (value, meta) {

                return Text('${value.toInt()}',
                    style: TextStyle(
                      color: Color(0xFF5F5E5E),
                      fontSize: 10.r,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 2.70,
                      letterSpacing: -0.30,
                    )
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: reservedBottomSize,
              getTitlesWidget: (double value, TitleMeta meta) {
                print('year:'+performance.keys.toList()[value.toInt()]);
                Widget text= const Text('');
                text=Text(performance.keys.toList()[value.toInt()],
                  style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 12.r,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.69,
                  letterSpacing: -0.48,
                ),
                );


                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: text,
                );
              },
            ),
          ),
        ),
        gridData: gridData,
        borderData: FlBorderData(show: false),

        barGroups:performance.values.toList()
      ),
    );

  }
}
