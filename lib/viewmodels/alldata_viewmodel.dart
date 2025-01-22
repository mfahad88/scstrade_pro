import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:scstrade_pro/models/allData/Alldata_indices.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../models/data/mock_data.dart';

class AlldataViewmodel extends ChangeNotifier {

  final ApiClient apiClient;

  ApiResponse<List<AlldataIndices>> apiResponse=ApiResponse(status: Status.loading);
  Timer? timer;
  AlldataViewmodel(this.apiClient){
    _startTimer();
    // _fetchAllData();
  }

  Future<void> _fetchAllData() async {
    try{
      apiResponse=await apiClient.fetchAllData();
    }catch(e){
      print('Error: $e');
    }finally{
      notifyListeners();
    }
  }

  List<AlldataIndices> fetchLeaders(){
    return apiResponse.data!..sort((a, b) => b.v!.compareTo(a.v!),)..take(10);
  }
  List<AlldataIndices> fetchGainers(){
    return apiResponse.data!..sort((a, b) => b.cl!.compareTo(a.cl!),)..take(10);
  }

  List<AlldataIndices> fetchLosers(){
    return apiResponse.data!..sort((a, b) => a.cl!.compareTo(b.cl!),)..take(10);
  }

  List<AlldataIndices>? fetchByIndex(String index){
    return apiResponse.data?.where((element) {
              if(!index.toLowerCase().contains('all')){
                return element.ind?.contains(index)??false;
              }else{
                return true;
              }
    },).toList();
  }

  void _startTimer(){
    timer=Timer.periodic(Duration(seconds: 5), (timer) {
      _fetchAllData();
    },);
  }

  void _stopTimer(){
    timer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}