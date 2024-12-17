import 'dart:io';

import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../models/todos/Todo.dart';

class TodoRepository{
  final ApiClient _apiClient;

  TodoRepository(this._apiClient);

  Future<ApiResponse<Todo>?> getTodos() async {
    try {
      final result = await InternetAddress.lookup(ApiClient.baseUrl.replaceAll('https://', ''));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return await _apiClient.fetchTodos();
      }
    }catch(e){
      if(e is SocketException){
        return Future(() => ApiResponse(
            status: Status.error,
            message: 'Please check your internet connection.'
        ),);
      }
    }
    return null;
  }
}