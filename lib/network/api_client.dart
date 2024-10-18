import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scstrade_pro/data/dto/Index_group.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/data/dto/announcement/Announcement.dart';
import 'package:scstrade_pro/data/dto/announcement/Meetings.dart';
import 'package:scstrade_pro/data/dto/announcement/News.dart';
import 'dart:convert';

import 'package:scstrade_pro/data/dto/kse_indices.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiClient{
  static const String _baseUrl = 'https://dataapi.scstrade.com';
  static SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  static Future<List<KseIndices>> fetchIndices() async {
    final response = await http.get(
        Uri.parse('$_baseUrl/Data?que=KSE Indices'));


    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      print(list);
      return list.map((e) => KseIndices.fromJson(e),).toList();
    } else {
      throw Exception('Failed to load Indices');
    }
  }

  static Future<List<StockData>> fetchStocks() async{
    final response = await http.get(Uri.parse('$_baseUrl/Data?que=AllData'));
    print('---------------------Request-------------------------------\n${response.request.toString()}\n---------------------------------------------');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);


      print('---------------------Response-------------------------------\n$body\n---------------------------------------------');

      return body.map((e) => StockData.fromJson(e),).toList();
   /*  return await compute((message) {

        List<dynamic> body = json.decode(message);


         print('---------------------Response-------------------------------\n$body\n---------------------------------------------');

        return body.map((e) => StockData.fromJson(e),).toList();
      }, response.body);*/
    } else {

      throw Exception('Failed to load Indices');
    }
  }

  static Future<List<IndexGroup>> fetchIndexGroup(String query) async{
    final response = await http.get(Uri.parse('$_baseUrl/Data?que=$query Group'));
    print('---------------------Request-------------------------------\n${response.request.toString()}\n---------------------------------------------');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);


      print('---------------------Response-------------------------------\n$body\n---------------------------------------------');

      return body.map((e) => IndexGroup.fromJson(e),).toList();

    } else {

      throw Exception('Failed to load Indices');
    }
  }

  static Stream<List<StockData>> fetchStocksUsingHttpClient() async* {

    final response = await http.get(Uri.parse('$_baseUrl/Data?que=AllData'));
    print('---------------------Request-------------------------------\n${response.request.toString()}\n---------------------------------------------');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);


      print('---------------------Response-------------------------------\n$body\n---------------------------------------------');

      // yield body.map((e) => StockData.fromJson(e),).toList();
        yield await compute((message) {

        List<dynamic> body = json.decode(message);


         print('---------------------Response-------------------------------\n$body\n---------------------------------------------');

        return body.map((e) => StockData.fromJson(e),).toList();
      }, response.body);
    } else {

      throw Exception('Failed to load Indices');
    }
  }
  
  
  static Future<List<http.Response>> fetchAccouncements(AnnouncementProvider provider) async {
    var responses= await Future.wait([
      http.get(Uri.parse('$_baseUrl/Data?que=News')),
      http.get(Uri.parse('$_baseUrl/Data?que=Meetings')),
      http.get(Uri.parse('$_baseUrl/Data?que=Announcement'))
    ]);
    if(responses[0].statusCode==200 && responses[1].statusCode==200 && responses[2].statusCode==200){

      // meetings.forEach((element) => print('Company: ${element['company_code']}'),);
      return responses;

    }else{
      throw Exception('Failed to load Announcments');

    }

  }
}