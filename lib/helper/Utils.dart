import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/MyStock.dart';

class Utils{

  static List<MyStock> getStocks(int max){
    return [
      MyStock(image: 'images/spotify_logo.png', title: 'Spotify', shortName: 'SPOT', totalAmount: '\$71.05', profitLoss: '+ 2.94%', spots: randomNumbers(max)),
      MyStock(image: 'images/facebook_logo.png', title: 'Meta - Facebook', shortName: 'META', totalAmount: '\$90.79', profitLoss: '- 2.16%', spots: randomNumbers(max)),
      MyStock(image: 'images/tesla_logo.png', title: 'Tesla', shortName: 'TSLA', totalAmount: '\$207.47', profitLoss: '+ 2.37%', spots: randomNumbers(max)),
      MyStock(image: 'images/facebook_logo.png', title: 'Meta - Facebook', shortName: 'META', totalAmount: '\$90.79', profitLoss: '- 2.16%', spots: randomNumbers(max)),
      MyStock(image: 'images/spotify_logo.png', title: 'Spotify', shortName: 'SPOT', totalAmount: '\$71.05', profitLoss: '+ 2.94%', spots: randomNumbers(max)),
      MyStock(image: 'images/spotify_logo.png', title: 'Spotify', shortName: 'SPOT', totalAmount: '\$71.05', profitLoss: '+ 2.94%', spots: randomNumbers(max))
    ];
  }

  static List<FlSpot> randomNumbers(int max){
    var random = Random();
    var generatedNumbers = <FlSpot>[];
    int count = max; // Specify how many unique random numbers you want to generate

    while (generatedNumbers.length < count) {
      double randomDoubleX = double.parse((random.nextDouble() * 5).toStringAsFixed(5));
      double randomDoubleY = double.parse((random.nextDouble() * count).toStringAsFixed(count));
      generatedNumbers.add(FlSpot(generatedNumbers.length.toDouble(), randomDoubleY));
    }

    return generatedNumbers;
  }

  static bool isDark(BuildContext context){
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}