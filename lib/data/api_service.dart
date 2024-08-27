import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

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
    print("Response: ${response.body}");

    if(response.statusCode == 200){
      return compute(parseKseIndex, response.body);
    }else{
      throw Exception('Failed to load data \nStatus Code:${response.statusCode}');
    }
  }

  List<KseIndex> parseKseIndex(String message) {
    final dynamic json=jsonDecode(message);
    final list = json['d'] as List;
    return list.map((e) => KseIndex.fromJson(e)).toList();
  }
}