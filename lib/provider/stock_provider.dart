import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/data/dto/change_opacity.dart';
import 'package:scstrade_pro/database/scs_database.dart';
import 'package:scstrade_pro/network/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/stock.dart';

class StockProvider extends ChangeNotifier{
  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
  Set<String> _sector={"All Sector"};
  List<String> menu=["Add to Watchlist"];
  List<String> _filterMenu=["Symbol","Company Name","Highest Volume","Lowest Volume"];
  List<String> _indices=["KSE ALL","KSE 100 Index","KSE 30 Index","KMI All Index","KMI 30 Index"];
  String _selectedIndex="KSE ALL";
  String _selectedFilter="Symbol";
  String _selectedSector="All Sector";

  List<Stock?> _stocks=[];
  List<StockData> _stockData=List.empty(growable: true);
  List<StockData> _previousStocks=[];
  List<StockData> watchList=[];
  bool _isLoading=false;
  ScsDatabase db=ScsDatabase.instance;


  Set<String> get sector => _sector;

  set sector(Set<String> list) {

    list.forEach((element) {
      _sector.add(element);
    },);
    // _sector = value;
    // notifyListeners();
  }



  List<String> get filterMenu => _filterMenu;

  set filterMenu(List<String> value) {
    _filterMenu = value;
  }

  List<String> get indices => _indices;

  set indices(List<String> value) {
    _indices = value;
  }

  String get selectedIndex => _selectedIndex;

  set selectedIndex(String value) {
    _selectedIndex = value;
    notifyListeners();
  }

  String get selectedFilter => _selectedFilter;

  set selectedFilter(String value) {
    _selectedFilter = value;
    notifyListeners();
  }

  String get selectedSector => _selectedSector;

  set selectedSector(String value) {
    _selectedSector = value;
    notifyListeners();
  }

  List<Stock?> get stocks{
    if(_selectedSector==sector.first){
      if(_selectedFilter==_filterMenu[0]){
        _stocks.sort((a, b) => a!.stockData.sym!.compareTo(b!.stockData.sym!));
      }else if(_selectedFilter==_filterMenu[1]){
        _stocks.sort((a, b) => a!.stockData.nm!.compareTo(b!.stockData.nm!));
      }else if(_selectedFilter==_filterMenu[2]){
        _stocks.sort((a, b) => b!.stockData.v!.compareTo(a!.stockData.v!));
      }else if(_selectedFilter==_filterMenu[3]){
        _stocks.sort((a, b) => a!.stockData.v!.compareTo(b!.stockData.v!));
      }

      return _selectedIndex!=indices.first?_stocks.where((element) => element!.stockData.ind!.contains('$_selectedIndex|'),).toList():_stocks;
    }else{
      if(_selectedFilter==_filterMenu[0]){
        _stocks.sort((a, b) => a!.stockData.sym!.compareTo(b!.stockData.sym!));
      }else if(_selectedFilter==_filterMenu[1]){
        _stocks.sort((a, b) => a!.stockData.nm!.compareTo(b!.stockData.nm!));
      }else if(_selectedFilter==_filterMenu[2]){
        _stocks.sort((a, b) => b!.stockData.v!.compareTo(a!.stockData.v!));
      }else if(_selectedFilter==_filterMenu[3]){
        _stocks.sort((a, b) => a!.stockData.v!.compareTo(b!.stockData.v!));
      }

      return _selectedIndex!=indices.first?_stocks.where((element) => element!.stockData.sn==_selectedSector && element!.stockData.ind!.contains('$_selectedIndex|')).toList():_stocks.where((element) => element!.stockData.sn==_selectedSector).toList();
    }
  }

  set stocks(List<Stock?> value) {
    _stocks = value;
  }

  List<StockData> get stockData => _stockData;

  set stockData(List<StockData> value) {
    _stockData = value;
  }

  List<StockData> get previousStocks => _previousStocks;

  set previousStocks(List<StockData> value) {
    _previousStocks = value;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future<int> addWatchList(String data){
    return db.create(data);
  }

  Future<int> removeWatchList(String data){
    return db.delete(data);
  }


  void fetchStocks() async{

    try {
      _previousStocks=_stockData;
      _stockData= await ApiClient.fetchStocks();
      if(_stockData.isNotEmpty){
        db.readAll().then((list) {
          _stocks.clear();
          if(list.isNotEmpty){

            _stockData.forEach((element) {
              _stocks.add(Stock(element, _previousStocks.where((e) => element.sym==e.sym,).first.bp!.compareTo(element.bp!)!=0.0?1.0:0.0,
                  _previousStocks.where((e) => element.sym==e.sym,).first.bv!.compareTo(element.bv!)!=0.0?1.0:0.0,
                  _previousStocks.where((e) => element.sym==e.sym,).first.ap!.compareTo(element.ap!)!=0.0?1.0:0.0,
                  _previousStocks.where((e) => element.sym==e.sym,).first.av!.compareTo(element.av!)!=0.0?1.0:0.0,
                  list.where((e) =>e.toString() == element.sym ,).firstOrNull == null ? false:true));
            },);
          }else{
            _stockData.forEach((element) {
              _stocks.add(Stock(element, _previousStocks.where((e) => element.sym==e.sym,).first.bp!.compareTo(element.bp!)!=0.0?1.0:0.0,
                  _previousStocks.where((e) => element.sym==e.sym,).first.bv!.compareTo(element.bv!)!=0.0?1.0:0.0,
                  _previousStocks.where((e) => element.sym==e.sym,).first.ap!.compareTo(element.ap!)!=0.0?1.0:0.0,
                  _previousStocks.where((e) => element.sym==e.sym,).first.av!.compareTo(element.av!)!=0.0?1.0:0.0,
                  false));
            },);
          }
        },);

      }


      //_compareStocks();

    }catch (error){
      print('Error fetching indices: $error');
    }finally{
      notifyListeners();
    }
  }

  void addSector(List<String?> list){
    list.forEach((element) => sector.add(element!),);
    // _selectedSector=sector.first;
    // notifyListeners();
  }
}