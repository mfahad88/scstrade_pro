import '../models/allData/Alldata_indices.dart';
import '../models/response/api_response.dart';
import '../services/api_client.dart';

class AllDataRepository {
  final ApiClient apiClient;

  AllDataRepository(this.apiClient);

  Future<ApiResponse<List<AlldataIndices>>> fetchAllData() async{
    try{
      return await apiClient.fetchAllData();
    }catch (e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }
}