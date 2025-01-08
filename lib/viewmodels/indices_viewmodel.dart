import 'package:flutter/material.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/repositories/indices_repository.dart';

import '../models/response/api_response.dart';

class IndicesViewModel extends ChangeNotifier{
  final IndicesRepository indicesRepository;
  ApiResponse apiResponse=ApiResponse(status: Status.loading);

  IndicesViewModel(this.indicesRepository);

  Future<void> fetchIndices() async {
    try{
      apiResponse=await indicesRepository.fetchIndices();
    }catch (e){
      print('Error: $e');
    }finally{
      notifyListeners();
    }
  }

  Future<void> fetchByIndex(String query) async {
    try{
      
      apiResponse=await indicesRepository.fetchByIndex(query);
    }catch (e){
      print('Error: $e');
    }finally{
      notifyListeners();
    }
  }
}