import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../models/response/api_response.dart';

class LoginRepository{
  final ApiClient apiClient;

  LoginRepository(this.apiClient);

  Future<ApiResponse<List<KseIndices>>?> fetchKseIndices() async {
    try{
      return await apiClient.fetchKseIndices();
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<String>> submitRegister({required String name, required String email, required String mobileNo}) async{
    try{
      return await apiClient.submitRegister(name: name, email: email, mobileNo: mobileNo);
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }
}