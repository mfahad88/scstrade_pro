import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Utils{



  static List<FlSpot> randomNumbers(int max){
    var random = Random();
    var generatedNumbers = <FlSpot>[];
    int count = max; // Specify how many unique random numbers you want to generate

    while (generatedNumbers.length < count) {
      // double randomDoubleX = double.parse((random.nextDouble() * 5).toStringAsFixed(5));
      double randomDoubleY = double.parse((random.nextDouble() * 5).toStringAsFixed(5));
      generatedNumbers.add(FlSpot(generatedNumbers.length.toDouble(), randomDoubleY));
    }

    return generatedNumbers;
  }

  static bool isDark(BuildContext context){
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}