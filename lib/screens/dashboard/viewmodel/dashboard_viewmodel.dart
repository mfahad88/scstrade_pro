import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/dto/Index_group.dart';
import 'package:scstrade_pro/data/dto/kse_indices.dart';
import 'package:scstrade_pro/network/api_client.dart';

class DashboardViewModel extends ChangeNotifier{
  GlobalKey key=GlobalKey();
  List<KseIndices> kseIndices=List.empty(growable: true);
  List<IndexGroup> indexGroup=List.empty(growable: true);
  bool isLoading=false;
  String _selectedValue='KSE 100';
  var _currentIndex=0.0;
  var _preClose=0.0;
  var percentChange=0.0;
  var netChange=0.0;
  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    _currentIndex=double.parse(kseIndices.where((element) => element.indexCode?.contains(selectedValue)??false,).first.currentIndex??'0.0');
    _preClose=kseIndices.where((element) => element.indexCode?.contains(selectedValue)??false,).first.preClose??0.0;
    percentChange=((_currentIndex-_preClose)/_preClose)*100;
    netChange=_currentIndex-_preClose;

    notifyListeners();
  }

  Future<void> fetchDashboard() async {
    try{
      isLoading=true;
      var responses=await ApiClient.fetchDashboad(_selectedValue);
      kseIndices=(jsonDecode(responses[0].body) as List).map((e) => KseIndices.fromJson(e),).toList();
      indexGroup=(jsonDecode(responses[1].body) as List).map((e) => IndexGroup.fromJson(e),).toList();
    }catch(e){
      print(e.toString());
    }finally{

      isLoading=false;
      notifyListeners();
    }

  }

  fetchGroupIndex(String value) async {
    indexGroup=await ApiClient.fetchIndexGroup(value);
    notifyListeners();

  }
}