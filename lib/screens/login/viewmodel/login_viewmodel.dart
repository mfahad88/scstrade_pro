import 'package:flutter/material.dart';
import 'package:scstrade_pro/network/api_client.dart';

import '../../../data/dto/kse_indices.dart';

class LoginViewModel extends ChangeNotifier{
  List<KseIndices>? indices;
  String errorMessage='';
  String _selectedValue='';
  int selectedIndex=0;
  bool _obscureText=true;

  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }


  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
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