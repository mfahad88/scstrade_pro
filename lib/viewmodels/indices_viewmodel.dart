import 'package:flutter/material.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../models/indices/Indices.dart';
import '../models/response/api_response.dart';

class IndicesViewModel extends ChangeNotifier{
  final ApiClient apiClient;
  ApiResponse<List<IndicesSummary>> apiResponseSummary=ApiResponse<List<IndicesSummary>>(status: Status.loading);
  ApiResponse<List<Indices>> apiResponseIndices=ApiResponse<List<Indices>>(status: Status.loading);

  IndicesViewModel(this.apiClient);

  Future<void> fetchIndices() async {
    try{
      apiResponseSummary=await apiClient.fetchIndices();
    }catch (e){
      apiResponseSummary=ApiResponse(
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

      apiResponseIndices=await apiClient.fetchByIndex(query);
    }catch (e){
      apiResponseIndices=ApiResponse(
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