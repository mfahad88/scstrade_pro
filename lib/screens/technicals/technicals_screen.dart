import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TechnicalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildBarChart()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildQuarterlyBarChart()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildLineChart()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildCombinedChart1()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildCombinedChart2()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildCombinedChart3()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildCombinedChart4()),
              const SizedBox(height: 16),
              SizedBox(height: 300, child: _buildCombinedChart5()),
            ],
          ),
        ),
      ),
    );
  }

  // Chart 1: Earnings Per Share (Bar Chart)
  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        maxY: 75,
        barGroups: [
          _makeBarChartGroupData(0, 14.83),
          _makeBarChartGroupData(1, 18.31),
          _makeBarChartGroupData(2, 27.53),
          _makeBarChartGroupData(3, 23.27),
          _makeBarChartGroupData(4, 21.28),
          _makeBarChartGroupData(5, 31.11),
          _makeBarChartGroupData(6, 52.23),
          _makeBarChartGroupData(7, 48.59),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('2017');
                  case 1:
                    return const Text('2018');
                  case 2:
                    return const Text('2019');
                  case 3:
                    return const Text('2020');
                  case 4:
                    return const Text('2021');
                  case 5:
                    return const Text('2022');
                  case 6:
                    return const Text('2023');
                  case 7:
                    return const Text('2024');
                  default:
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // Chart 2: Quarterly Earnings Per Share (Grouped Bar Chart)
  Widget _buildQuarterlyBarChart() {
    return BarChart(
      BarChartData(
        maxY: 20,
        barGroups: [
          _makeQuarterlyBarChartGroupData(0, [6.96, 3.94]),
          _makeQuarterlyBarChartGroupData(1, [5.45, 5.85]),
          _makeQuarterlyBarChartGroupData(2, [7.82, 5.06, 10.03]),
          _makeQuarterlyBarChartGroupData(3, [12.39, 9.7, 15.03, 11.4]),
          _makeQuarterlyBarChartGroupData(4, [17.27, 8.81]),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('2020');
                  case 1:
                    return const Text('2021');
                  case 2:
                    return const Text('2022');
                  case 3:
                    return const Text('2023');
                  case 4:
                    return const Text('2024');
                  default:
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // Chart 3: Index vs Stocks (Line Chart)
  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        minY: 100,
        maxY: 180,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 130),
              const FlSpot(1, 128),
              const FlSpot(2, 132),
              const FlSpot(3, 135),
              const FlSpot(4, 138),
              const FlSpot(5, 145),
              const FlSpot(6, 150),
              const FlSpot(7, 160),
              const FlSpot(8, 165),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 120),
              const FlSpot(1, 125),
              const FlSpot(2, 130),
              const FlSpot(3, 135),
              const FlSpot(4, 140),
              const FlSpot(5, 145),
              const FlSpot(6, 150),
              const FlSpot(7, 155),
              const FlSpot(8, 160),
            ],
            isCurved: true,
            color: Colors.black,
            barWidth: 2,
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(sideTitles: _buildBottomTitles()),
        ),
      ),
    );
  }

  // Chart 4: Book Value and Price to Book Value (Combined Line and Bar Chart)
  Widget _buildCombinedChart1() {
    return BarChart(
      BarChartData(
        maxY: 300,
        barGroups: [
          _makeBarChartGroupData(0, 165.21),
          _makeBarChartGroupData(1, 178.95),
          _makeBarChartGroupData(2, 203.54),
          _makeBarChartGroupData(3, 251.78),
          _makeBarChartGroupData(4, 290.75),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(sideTitles: _buildBottomTitles()),
        ),
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(y: 0.7, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 0.6, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 0.5, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 0.45, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 0.4, color: Colors.black, strokeWidth: 2),
        ]),
      ),
    );
  }

  // Chart 5: Return on Equity, Assets, and CE (Line Chart)
  Widget _buildCombinedChart2() {
    return LineChart(
      LineChartData(
        maxY: 25,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 14.08),
              const FlSpot(1, 11.89),
              const FlSpot(2, 15.28),
              const FlSpot(3, 20.74),
              const FlSpot(4, 16.71),
            ],
            color: Colors.blue,
            isCurved: true,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 11.26),
              const FlSpot(1, 9.57),
              const FlSpot(2, 11.84),
              const FlSpot(3, 15.77),
              const FlSpot(4, 13.03),
            ],
            color: Colors.black,
            isCurved: true,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 19.82),
              const FlSpot(1, 15.28),
              const FlSpot(2, 10.03),
              const FlSpot(3, 20.74),
              const FlSpot(4, 15.03),
            ],
            color: Colors.green,
            isCurved: true,
            barWidth: 2,
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(sideTitles: _buildBottomTitles()),
        ),
      ),
    );
  }

  // Chart 6: Dividend and Dividend Yield (Combined Line and Bar Chart)
  Widget _buildCombinedChart3() {
    return BarChart(
      BarChartData(
        maxY: 15,
        barGroups: [
          _makeBarChartGroupData(0, 6.75),
          _makeBarChartGroupData(1, 6.9),
          _makeBarChartGroupData(2, 7.25),
          _makeBarChartGroupData(3, 8.55),
          _makeBarChartGroupData(4, 10.1),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(sideTitles: _buildBottomTitles()),
        ),
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(y: 5, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 6, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 8, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 10, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 11, color: Colors.black, strokeWidth: 2),
        ]),
      ),
    );
  }

  // Chart 7: Payout Ratio (Line Chart)
  Widget _buildCombinedChart4() {
    return LineChart(
      LineChartData(
        maxY: 40,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 29.01),
              const FlSpot(1, 32.42),
              const FlSpot(2, 23.31),
              const FlSpot(3, 16.37),
              const FlSpot(4, 20.79),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(sideTitles: _buildBottomTitles()),
        ),
      ),
    );
  }

  // Chart 8: Sales per Share and Price to Sales (Combined Line and Bar Chart)
  Widget _buildCombinedChart5() {
    return BarChart(
      BarChartData(
        maxY: 150,
        barGroups: [
          _makeBarChartGroupData(0, 56.93),
          _makeBarChartGroupData(1, 55.59),
          _makeBarChartGroupData(2, 78),
          _makeBarChartGroupData(3, 96.16),
          _makeBarChartGroupData(4, 107.81),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: _buildLeftTitles()),
          bottomTitles: AxisTitles(sideTitles: _buildBottomTitles()),
        ),
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(y: 2.0, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 1.8, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 1.4, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 1.3, color: Colors.black, strokeWidth: 2),
          HorizontalLine(y: 1.2, color: Colors.black, strokeWidth: 2),
        ]),
      ),
    );
  }

  // Helper functions for Bar and Grouped Bar Charts
  BarChartGroupData _makeBarChartGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.lightGreen,
          width: 20,
        ),
      ],
    );
  }

  BarChartGroupData _makeQuarterlyBarChartGroupData(int x, List<double> values) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: values[0], color: Colors.blue, width: 10),
        BarChartRodData(toY: values[1], color: Colors.black, width: 10),
        BarChartRodData(toY: values.length > 2 ? values[2] : 0, color: Colors.green, width: 10),
        BarChartRodData(toY: values.length > 3 ? values[3] : 0, color: Colors.orange, width: 10),
      ],
      barsSpace: 4,
    );
  }

  // Helper for left-side Y-axis labels
  SideTitles _buildLeftTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (double value, TitleMeta meta) {
        return Text(value.toInt().toString());
      },
      reservedSize: 40,
    );
  }

  // Helper for bottom-side X-axis labels
  SideTitles _buildBottomTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (double value, TitleMeta meta) {
        return Text(value.toInt().toString());
      },
      reservedSize: 40,
    );
  }
}


