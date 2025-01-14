import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/snapshot/Overview.dart';
import 'package:scstrade_pro/services/api_client.dart';

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
}