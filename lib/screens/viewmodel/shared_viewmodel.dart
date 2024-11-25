import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/dto/Stock_data.dart';
import '../../network/api_client.dart';

class SharedViewModel extends ChangeNotifier{
  List<StockData> stockData=List.empty(growable: true);
  String _selectedValue='';

  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }

  Timer? _timer;
  fetchStocks() async {
    stockData=await ApiClient.fetchStocks();
    if(_selectedValue==''){
      _selectedValue=stockData.map((e) => e.sn,).toSet().first!;
    }
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      stockData=await ApiClient.fetchStocks();

      notifyListeners();
    },);
    notifyListeners();
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}