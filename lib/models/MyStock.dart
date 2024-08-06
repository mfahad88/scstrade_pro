import 'package:fl_chart/fl_chart.dart';

class MyStock{
  final String image;
  final String title;
  final String shortName;
  final String totalAmount;
  final String profitLoss;
  final List<FlSpot> spots;

  MyStock({required this.image,required this.title, required this.shortName, required this.totalAmount, required this.profitLoss,
    required this.spots});


}