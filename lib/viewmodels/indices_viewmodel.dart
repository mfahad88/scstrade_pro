import 'package:flutter/material.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../models/response/api_response.dart';

class IndicesViewModel extends ChangeNotifier{
  final ApiClient apiClient;
  ApiResponse apiResponse=ApiResponse(status: Status.loading);

  IndicesViewModel(this.apiClient);

  Future<void> fetchIndices() async {
    try{
      apiResponse=await apiClient.fetchIndices();
    }catch (e){
      apiResponse=ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
      print('Error: $e');
    }finally{
      notifyListeners();
    }
  }

  Future<void> fetchByIndex(String query) async {
    try{
      
      apiResponse=await apiClient.fetchByIndex(query);
    }catch (e){
      apiResponse=ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
      print('Error: $e');
    }finally{
      notifyListeners();
    }
  }
}