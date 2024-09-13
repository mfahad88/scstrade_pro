import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/data/dto/change_opacity.dart';
import 'package:scstrade_pro/database/scs_database.dart';
import 'package:scstrade_pro/network/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockProvider extends ChangeNotifier{
  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
  Set<String> _sector={"All Sector"};
  List<String> menu=["Add to Watchlist"];
  List<String> _filterMenu=["Symbol","Company Name","Highest Volume","Lowest Volume"];
  List<String> _indices=["KSE ALL","KSE 100 Index","KSE 30 Index","KMI All Index","KMI 30 Index"];
  String _selectedIndex="KSE ALL";
  String _selectedFilter="Symbol";
  String _selectedSector="All Sector";
  List<StockData> _stocks=[];
  List<StockData> _previousStocks=[];
  List<StockData> watchList=[];
  bool _isLoading=false;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<ChangeOpacity> _opacityBp=[];
  List<ChangeOpacity> _opacityBv=[];
  List<ChangeOpacity> _opacityAp=[];
  List<ChangeOpacity> _opacityAv=[];
  final db=ScsDatabase.instance;




  Future<int> addWatchList(String data){
    return db.create(data);
  }

  void removeWatchList(String data){
    db.delete(data);
  }
  void fetchWatchList() async {

    try{
      _isLoading = true;
      List<Object?> list =await db.readAll();

      watchList.clear();
      for(int j=0;j<list.length;j++){
        watchList.add(stocks![stocks!.indexWhere((element) => element.sym == list[j],)]);
      }


    }catch(e){
      throw e;
    }finally{
      _isLoading =false;
      notifyListeners();
    }



  }

  List<StockData> get previousStocks{
    if(_selectedSector==sector.first){
      if(_selectedFilter==_filterMenu[0]){
        _previousStocks.sort((a, b) => a.sym!.compareTo(b.sym!));
      }else if(_selectedFilter==_filterMenu[1]){
        _previousStocks.sort((a, b) => a.nm!.compareTo(b.nm!));
      }else if(_selectedFilter==_filterMenu[2]){
        _previousStocks.sort((a, b) => b.v!.compareTo(a.v!));
      }else if(_selectedFilter==_filterMenu[3]){
        _previousStocks.sort((a, b) => a.v!.compareTo(b.v!));
      }
      return _selectedIndex!=indices.first?_stocks.where((element) => element.ind!.contains('$_selectedIndex|'),).toList():_stocks;
    }else{
      if(_selectedFilter==_filterMenu[0]){
        _previousStocks.sort((a, b) => a.sym!.compareTo(b.sym!));
      }else if(_selectedFilter==_filterMenu[1]){
        _previousStocks.sort((a, b) => a.nm!.compareTo(b.nm!));
      }else if(_selectedFilter==_filterMenu[2]){
        _previousStocks.sort((a, b) => b.v!.compareTo(a.v!));
      }else if(_selectedFilter==_filterMenu[3]){
        _previousStocks.sort((a, b) => a.v!.compareTo(b.v!));
      }
      return _selectedIndex!=indices.first?_previousStocks.where((element) => element.sn==_selectedSector && element.ind!.contains('$_selectedIndex|')).toList():_previousStocks.where((element) => element.sn==_selectedSector).toList();
    }
  }

  set previousStocks(List<StockData> value) {
    _previousStocks = value;
    notifyListeners();
  }

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
      _previousStocks=_stocks;
      _stocks= await ApiClient.fetchStocks();

      if(opacityBp.isEmpty) {
        _opacityBp = List.filled(_stocks.length, ChangeOpacity(1.0,true),growable: true);
        _opacityBv = List.filled(_stocks.length, ChangeOpacity(1.0,true),growable: true);
        _opacityAp = List.filled(_stocks.length, ChangeOpacity(1.0,true),growable: true);
        _opacityAv = List.filled(_stocks.length, ChangeOpacity(1.0,true),growable: true);

      }

      _compareStocks();

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

  List<ChangeOpacity> get opacityAv => _opacityAv;

  set opacityAv(List<ChangeOpacity> value) {
    _opacityAv = value;
    notifyListeners();
  }

  List<ChangeOpacity> get opacityAp => _opacityAp;

  set opacityAp(List<ChangeOpacity> value) {
    _opacityAp = value;
    notifyListeners();
  }

  List<ChangeOpacity> get opacityBv => _opacityBv;

  set opacityBv(List<ChangeOpacity> value) {
    _opacityBv = value;
    notifyListeners();
  }

  List<ChangeOpacity> get opacityBp => _opacityBp;

  set opacityBp(List<ChangeOpacity> value) {
    _opacityBp = value;
    notifyListeners();
  }

  void _compareStocks(){
    for(int i=0;i<_stocks.length;i++){
      if(_stocks![i].bp!.compareTo(_previousStocks[i].bp!)!=0){
        _opacityBp[i]=ChangeOpacity(1.0, _stocks![i].bp!.compareTo(_previousStocks[i].bp!)==-1?false:_stocks![i].bp!.compareTo(_previousStocks[i].bp!)==1?true:null);

      }else{
        _opacityBp[i]=ChangeOpacity(1.0, _stocks![i].bp!.compareTo(_previousStocks[i].bp!)==-1?false:_stocks![i].bp!.compareTo(_previousStocks[i].bp!)==1?true:null);
        opacityBp=_opacityBp;
      }

      if(_stocks![i].bv!.compareTo(_previousStocks[i].bv!)!=0){
        _opacityBv[i]=ChangeOpacity(1.0, _stocks![i].bv!.compareTo(_previousStocks[i].bv!)==-1?false:_stocks![i].bv!.compareTo(_previousStocks[i].bv!)==1?true:null);

      }else{
        _opacityBv[i]=_opacityBv[i]=ChangeOpacity(0.0, _stocks![i].bv!.compareTo(_previousStocks[i].bv!)==-1?false:_stocks![i].bv!.compareTo(_previousStocks[i].bv!)==1?true:null);
        opacityBv=_opacityBv;
      }

      if(_stocks![i].ap!.compareTo(_previousStocks[i].ap!)!=0){
        _opacityAp[i]=ChangeOpacity(1.0, _stocks![i].ap!.compareTo(_previousStocks[i].ap!)==-1?false:_stocks![i].ap!.compareTo(_previousStocks[i].ap!)==1?true:null);

      }else{
        _opacityAp[i]=ChangeOpacity(0.0, _stocks![i].ap!.compareTo(_previousStocks[i].ap!)==-1?false:_stocks![i].ap!.compareTo(_previousStocks[i].ap!)==1?true:null);
        opacityAp= _opacityAp;
      }

      if(_stocks![i].av!.compareTo(_previousStocks[i].av!)!=0){
        _opacityAv[i]=ChangeOpacity(1.0, _stocks![i].av!.compareTo(_previousStocks[i].av!)==-1?false:_stocks![i].av!.compareTo(_previousStocks[i].av!)==1?true:null);

      }else{
        _opacityAv[i]=ChangeOpacity(0.0, _stocks![i].av!.compareTo(_previousStocks[i].av!)==-1?false:_stocks![i].av!.compareTo(_previousStocks[i].av!)==1?true:null);
        opacityAv= _opacityAv;
      }
      // notifyListeners();
    }
  }
}