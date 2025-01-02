import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  static Future<void> saveCredentials({required String name,required String email,required String mobileNo}) async {
    final SharedPreferencesAsync preferences= SharedPreferencesAsync();
    preferences.setString('name', name);
    preferences.setString('email', email);
    preferences.setString('mobileNo', mobileNo);
  }

  static Future<String?> fetchCredentials(String key) async {
    SharedPreferencesAsync preferences=SharedPreferencesAsync();
     return preferences.getString(key);
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
  static double percentToPx({required double percent,required Size size, bool isWidth=true}){
    if(isWidth){

      return size.width*(percent/100);
    }else{
      return size.height*(percent/100);
    }
  }

 static TextTheme createTextTheme(
     BuildContext context, String bodyFontString, String displayFontString) {
   TextTheme baseTextTheme = Theme.of(context).textTheme;
   TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
   TextTheme displayTextTheme =
   GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
   TextTheme textTheme = displayTextTheme.copyWith(
     bodyLarge: bodyTextTheme.bodyLarge!.copyWith(
       fontSize: 16.r
     ),
     bodyMedium: bodyTextTheme.bodyMedium!.copyWith(
         fontSize: 14.r
     ),
     bodySmall: bodyTextTheme.bodySmall!.copyWith(
         fontSize: 12.r
     ),
     headlineLarge: bodyTextTheme.headlineLarge!.copyWith(
         fontSize: 32.r
     ),
     headlineMedium: bodyTextTheme.headlineMedium!.copyWith(
         fontSize: 34.r
     ),
     headlineSmall: bodyTextTheme.headlineSmall!.copyWith(
         fontSize: 24.r
     ),
     labelLarge: bodyTextTheme.labelLarge!.copyWith(
         fontSize: 14.r
     ),
     labelMedium: bodyTextTheme.labelMedium!.copyWith(
         fontSize: 12.r
     ),
     labelSmall: bodyTextTheme.labelSmall!.copyWith(
         fontSize: 9.r
     ),
   );
   return textTheme;
 }

 static String dateFormatter({required DateTime dateTime, required String format}){
    var formatter=DateFormat(format);
    return formatter.format(dateTime);
 }
}