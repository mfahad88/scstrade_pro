import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/dto/Stock_data.dart';
import '../../network/api_client.dart';

class SharedViewModel extends ChangeNotifier{
  List<StockData> stockData=List.empty(growable: true);
  String _selectedValue='';
  List indices=['KSE All','KSE 100','KSE 30','KMI 30','KMI All'];
  List sortBy=['Symbol','Highest Volume','Low Volume','Highest Price','Lowest Price'];
  String _selectedIndices='KSE 100';
  String _selectedSortBy='Symbol';
  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }

  Timer? _timer;
  void fetchStocks() async {
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


  String get selectedIndices => _selectedIndices;

  set selectedIndices(String value) {
    _selectedIndices = value;
    /*stockData.where((element) => element.ind?.contains(selectedIndices)??false,).toList().sort((a, b) {
      if(selectedSortBy==sortBy[0]){
        return b.sym!.compareTo(a.sym!);
      }else if(selectedSortBy==sortBy[1]){
        return b.v!.compareTo(a.v!);
      }else if(selectedSortBy==sortBy[2]){
        return a.v!.compareTo(b.v!);
      }else if(selectedSortBy==sortBy[3]){
        return b.hp!.compareTo(a.hp!);
      }else if(selectedSortBy==sortBy[4]){
        return a.lp!.compareTo(b.lp!);
      }else{
        return b.nm!.compareTo(a.nm!);
      }
    },);*/
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get selectedSortBy => _selectedSortBy;

  set selectedSortBy(String value) {
    _selectedSortBy = value;
    /*stockData.where((element) => element.ind?.contains(selectedIndices)??false,).toList().sort((a, b) {
      if(selectedSortBy==sortBy[0]){
        return b.sym!.compareTo(a.sym!);
      }else if(selectedSortBy==sortBy[1]){
        return b.v!.compareTo(a.v!);
      }else if(selectedSortBy==sortBy[2]){
        return a.v!.compareTo(b.v!);
      }else if(selectedSortBy==sortBy[3]){
        return b.hp!.compareTo(a.hp!);
      }else if(selectedSortBy==sortBy[4]){
        return a.lp!.compareTo(b.lp!);
      }else{
        return b.nm!.compareTo(a.nm!);
      }
    },);*/
    notifyListeners();
  }
}