import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scstrade_pro/models/index_summary.dart';

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

  static List<IndexSummary> getIndexSummary(){
    return [
      IndexSummary('KSE100','78,207.25','+216.59(+0.28%)'),
      IndexSummary('KSE30','78,207.25','+216.59(+0.28%)'),
      IndexSummary('KMI30','78,207.25','+216.59(+0.28%)'),
      IndexSummary('ALLSHR','78,207.25','+216.59(+0.28%)'),
      IndexSummary('KMIALLSHR','78,207.25','+216.59(+0.28%)'),
      IndexSummary('BKTI','78,207.25','-216.59(-0.28%)')
    ];
  }

  static List<String> getIndex(){
    return ['KSE100','KSE30','KMI30','ALLSHR','KMIALLSHIR'];
  }

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

  static String roundTwoDecimal(double value){
  return value.toStringAsFixed(2);
  }

  static String commaSeparated(double value){
    final formatter = NumberFormat('#,###.##');
    return formatter.format(value);
  }

  static String formatToMillions(int number) {
    // Convert to millions and format to 2 decimal places
    double millions = number / 1000000;
    return millions.toStringAsFixed(2) + 'M';
  }

  static String convertDate(String dateString) {
    // Extract the timestamp from the /Date(...) format
    var timestamp = int.parse(dateString.replaceAll(RegExp(r'[^0-9]'), ''));

    // Convert timestamp to DateTime
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Format the DateTime to dd-MMM-yyyy
    String formattedDate = DateFormat('dd-MMM-yyyy').format(date);

    return formattedDate;
  }
}