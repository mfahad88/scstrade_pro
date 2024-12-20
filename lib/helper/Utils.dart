import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Utils{


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

  static String commaSeparated(String? value){
    double v=0.0;
    if(value?.isNotEmpty??false){
      v=double.parse(value!);
    }
    final formatter = NumberFormat('#,###.##');
    return formatter.format(v);
  }

  static String formatToMillions(double number) {
    if (number < 1000) {
      return number.toStringAsFixed(2); // e.g., 1373.39
    } else {
      return (number / 1000000).toStringAsFixed(1) + 'M'; // e.g., 1.4M
    }
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

  static DateTime epochDate(String dateString) {
    // Extract the timestamp from the /Date(...) format
    var timestamp = int.parse(dateString.replaceAll(RegExp(r'[^0-9]'), ''));

    // Convert timestamp to DateTime
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return date;
  }

  static double responsiveSize(double screenWidth,double baseWidth){
    double scaleFactor = screenWidth / 480;
    return  baseWidth * scaleFactor;
  }

  static void showErrorDialog(BuildContext context,String errorMessage){
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        backgroundColor: const Color(0xffffc0c7),
        title: const Text('Error'),
        content: ListTile(
          title: Text(errorMessage),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK')),
        ],
      );
    },);

  }

 static TextTheme createTextTheme(
     BuildContext context, String bodyFontString, String displayFontString) {
   TextTheme baseTextTheme = Theme.of(context).textTheme;
   TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
   TextTheme displayTextTheme =
   GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
   TextTheme textTheme = displayTextTheme.copyWith(
     bodyLarge: bodyTextTheme.bodyLarge,
     bodyMedium: bodyTextTheme.bodyMedium,
     bodySmall: bodyTextTheme.bodySmall,
     headlineLarge: bodyTextTheme.headlineLarge,
     headlineMedium: bodyTextTheme.headlineMedium,
     headlineSmall: bodyTextTheme.headlineSmall,
     labelLarge: bodyTextTheme.labelLarge,
     labelMedium: bodyTextTheme.labelMedium,
     labelSmall: bodyTextTheme.labelSmall,
   );
   return textTheme;
 }
}