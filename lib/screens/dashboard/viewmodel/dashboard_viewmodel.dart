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

  Future<void> fetchDashboard() async {
    try{
      isLoading=true;
      var responses=await ApiClient.fetchDashboad();
      kseIndices=(jsonDecode(responses[0].body) as List).map((e) => KseIndices.fromJson(e),).toList();
      indexGroup=(jsonDecode(responses[0].body) as List).map((e) => IndexGroup.fromJson(e),).toList();
    }catch(e){
      print(e.toString());
    }finally{
      isLoading=false;
      notifyListeners();
    }

  }
}