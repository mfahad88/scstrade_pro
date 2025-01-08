import 'package:scstrade_pro/services/api_client.dart';

import '../models/indices/Indices.dart';
import '../models/indices/IndicesSummary.dart';
import '../models/response/api_response.dart';

class IndicesRepository{
  ApiClient apiClient;

  IndicesRepository(this.apiClient);

  Future<ApiResponse<List<IndicesSummary>?>> fetchIndices() async {
    try{
      return await apiClient.fetchIndices();
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<List<Indices>>> fetchByIndex(String query) async{
    try{
      return await apiClient.fetchByIndex(query);
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }
}