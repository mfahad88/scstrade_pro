import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/network/api_client.dart';

class StockProvider extends ChangeNotifier{
  Set<String> _sector={"All Sector"};
  List<String> menu=["Add to Watchlist"];
  List<String> _filterMenu=["Symbol","Company Name","Highest Volume","Lowest Volume"];
  List<String> _indices=["KSE ALL","KSE 100 Index","KSE 30 Index","KMI All Index","KMI 30 Index"];
  String _selectedIndex="KSE ALL";
  String _selectedFilter="Symbol";
  String _selectedSector="All Sector";
  List<StockData> _stocks=[];
  bool _isLoading=false;



  List<StockData>? get stocks{
    if(_selectedSector==sector.first){
      if(_selectedFilter==_filterMenu[0]){
        _stocks.sort((a, b) => a.sym!.compareTo(b.sym!));
      }else if(_selectedFilter==_filterMenu[1]){
        _stocks.sort((a, b) => a.nm!.compareTo(b.nm!));
      }else if(_selectedFilter==_filterMenu[2]){
        _stocks.sort((a, b) => b.v!.compareTo(a.v!));
      }else if(_selectedFilter==_filterMenu[3]){
        _stocks.sort((a, b) => a.v!.compareTo(b.v!));
      }
      return _selectedIndex!=indices.first?_stocks.where((element) => element.ind!.contains('$_selectedIndex|'),).toList():_stocks;
    }else{
      if(_selectedFilter==_filterMenu[0]){
        _stocks.sort((a, b) => a.sym!.compareTo(b.sym!));
      }else if(_selectedFilter==_filterMenu[1]){
        _stocks.sort((a, b) => a.nm!.compareTo(b.nm!));
      }else if(_selectedFilter==_filterMenu[2]){
        _stocks.sort((a, b) => b.v!.compareTo(a.v!));
      }else if(_selectedFilter==_filterMenu[3]){
        _stocks.sort((a, b) => a.v!.compareTo(b.v!));
      }
      return _selectedIndex!=indices.first?_stocks.where((element) => element.sn==_selectedSector && element.ind!.contains('$_selectedIndex|')).toList():_stocks.where((element) => element.sn==_selectedSector).toList();
    }

  }

  void addSector(List<String?> list){
    list.forEach((element) => sector.add(element!),);
    // _selectedSector=sector.first;
    // notifyListeners();
  }


  String get selectedSector => _selectedSector;

  set selectedSector(String value) {
    _selectedSector = value;
    notifyListeners();
  }

  set selectedFilter(String value){
    _selectedFilter = value;
    notifyListeners();
  }


  Set<String> get sector => _sector;



  void fetchStocks() async{
    try {
      _isLoading = true;
      _stocks= await ApiClient.fetchStocks();

    }catch (error){
      print('Error fetching indices: $error');
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  bool get isLoading => _isLoading;

  String get selectedFilter => _selectedFilter;

  List<String> get filterMenu => _filterMenu;

  set filterMenu(List<String> value) {
    _filterMenu = value;
    notifyListeners();
  }

  String get selectedIndex => _selectedIndex;

  set selectedIndex(String value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<String> get indices => _indices;

  set indices(List<String> value) {
    _indices = value;
    notifyListeners();
  }


}