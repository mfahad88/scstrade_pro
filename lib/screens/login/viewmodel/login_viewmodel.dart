import 'package:flutter/material.dart';
import 'package:scstrade_pro/network/api_client.dart';

import '../../../data/dto/kse_indices.dart';

class LoginViewModel extends ChangeNotifier{
  List<KseIndices>? indices;
  String errorMessage='';
  String selectedValue='';


  Future<void> fetchIndices() async {
    try{
      indices=await ApiClient.fetchIndices();
      errorMessage='';
    }catch(e){
      errorMessage=e.toString();
    }finally{
      notifyListeners();
    }
  }
}