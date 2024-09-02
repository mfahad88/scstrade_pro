import 'package:http/http.dart' as http;
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'dart:convert';

import 'package:scstrade_pro/data/dto/kse_indices.dart';
class ApiClient{
  static const String _baseUrl = 'http://185.185.50.7:81';

  static Future<List<KseIndices>> fetchIndices() async{
    final response = await http.get(Uri.parse('$_baseUrl/Data?que=KSE Indices'));

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

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      print(list);
      return list.map((e) => StockData.fromJson(e),).toList();
    } else {

      throw Exception('Failed to load Indices');
    }
  }
}