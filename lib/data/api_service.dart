import 'dart:convert';

import 'dto/KseIndex.dart';
import 'package:http/http.dart' as http;
class ApiService{
  final String _BASE_URL='https://scstrade.com';
  Future<List<KseIndex>> fetchKseIndex() async{
    final response=await http.post(Uri.parse('$_BASE_URL/api.aspx/apii'),
        headers: {
          'Content-Type': 'application/json',
        },
        body:jsonEncode({'que':'KSE Indices'}));
    //print("Response: ${response.body}");
    if(response.statusCode == 200){
      final dynamic json=jsonDecode(response.body);
      final list = json['d'] as List;
      return list.map((e) => KseIndex.fromJson(e)).toList();
    }else{
      throw Exception('Failed to load data \nStatus Code:${response.statusCode}');
    }
  }
}