import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/data/dto/kse_indices.dart';
import 'package:scstrade_pro/network/api_client.dart';

class DashboardProvider extends ChangeNotifier{
  List<KseIndices>? _indices;
  List<StockData> _stocks=[];

  List<StockData> get stocks => _stocks;
  String? _selectedIndex;
  TextEditingController editingController = TextEditingController();
  String? get selectedIndex => _selectedIndex;

  set selectedIndex(String? value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<KseIndices>? get indices => _indices;
  bool _isLoading = false;
  bool _isLineSelected=true;
  bool _isCandleSelected=false;
  List<bool> _isTime=[false,false,false,false,false];


  List<bool> get isTime => _isTime;

  set isTime(List<bool> value) {
    _isTime = value;
    notifyListeners();
  }

  bool get isLineSelected => _isLineSelected;

  set isLineSelected(bool value) {
    _isLineSelected = value;
    _isCandleSelected = !isLineSelected;
    notifyListeners();
  }

  bool get isCandleSelected => _isCandleSelected;

  set isCandleSelected(bool value) {
    _isCandleSelected = value;
    _isLineSelected = !isCandleSelected;
    notifyListeners();
  }

  fetchIndices() async {

    try {
      _isLoading = true;
      _indices = await ApiClient.fetchIndices();

    }catch (error){
      print('Error fetching indices: $error');
    }finally{
      _isLoading = false;
      _selectedIndex=_indices!.first.indexCode!;
      notifyListeners();
    }
  }



  bool get isLoading => _isLoading;
}