import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/snapshot/Overview.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../models/snapshot/chart/Chart.dart';
import '../models/snapshot/detail/Detail.dart';

class CompanyRepository{
  ApiClient apiClient;

  CompanyRepository(this.apiClient);

  Future<ApiResponse<Overview?>> fetchSnapshotOverview(String symbol) async {
    try{
      return await apiClient.fetchSnapshotOverview(symbol);
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }


  Future<ApiResponse<dynamic>> fetchSnapshotChart(String symbol) async {
    try{
      return await apiClient.fetchSnapshotChart(symbol);
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }


  Future<ApiResponse<List<Detail>>> fetchSnapshotDetail(String symbol) async {
    try{
      return await apiClient.fetchSnapshotDetail(symbol);
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }


}