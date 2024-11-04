import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/network/api_client.dart';

import '../../../data/dto/kse_indices.dart';

class LoginViewModel extends ChangeNotifier{
  List<KseIndices>? indices;
  String errorMessage='';
  String _selectedValue='';
  int selectedIndex=0;
  bool _obscureText=true;
  bool get obscureText => _obscureText;
  bool _isChecked=false;
  String _dailyPercentChange='';
  String _dailyChange='';
  String get dailyPercentChange => _dailyPercentChange;

  String get dailyChange => _dailyChange;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }


  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    double currentIndex=double.parse(indices?.where((element) => element.indexCode==value,).first.currentIndex??'0.0');
    double previousClose=indices?.where((element) => element.indexCode==value,).first.preClose??0.0;
    _dailyPercentChange='${Utils.roundTwoDecimal(((currentIndex - previousClose)*100)/previousClose)} %';
    _dailyChange = Utils.roundTwoDecimal(currentIndex- previousClose).contains('-')?'-${Utils.roundTwoDecimal(currentIndex- previousClose)}':'+${Utils.roundTwoDecimal(currentIndex- previousClose)}';
    notifyListeners();
  }

  Future<void> fetchIndices() async {
    try{
      indices=await ApiClient.fetchIndices();
      _selectedValue = indices?.first.indexCode??"";
      errorMessage='';
    }catch(e){
      errorMessage=e.toString();
    }finally{
      notifyListeners();
    }
  }
}