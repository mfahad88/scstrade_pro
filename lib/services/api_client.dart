import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/models/response/api_response.dart';

import '../models/todos/Todo.dart';

class ApiClient{
  static const baseUrl='https://dataapi.scstrade.com';
  Future<ApiResponse<Todo>> fetchTodos() async {
    try{

      final response=await http.get(Uri.parse('$baseUrl/todos'));
      final body = jsonDecode(response.body);
      return ApiResponse(
          status: Status.completed,
          data: Todo.fromJson(body),
          message: null
      );
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<List<KseIndices>>> fetchKseIndices() async{
    try{

      final response=await http.get(Uri.parse('$baseUrl/Data?que=KSE%20Indices'));
      List body = jsonDecode(response.body);
      ApiResponse<List<KseIndices>> apiResponse=ApiResponse<List<KseIndices>>(
          status: Status.completed,
          data: body.map((e) => KseIndices.fromJson(e),).toList(),
          message: null
      );
      print(apiResponse);
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }
  Future<ApiResponse<String>> submitRegister({required String name, required String email, required String mobileNo}) async {
    try{

      final response=await http.get(Uri.parse('$baseUrl/Data?que=Registration|$name|$email|$mobileNo'));
      print(response.request);
      List body = jsonDecode(response.body);

      ApiResponse<String> apiResponse=ApiResponse<String>(
          status: Status.completed,
          data: body.first['Status'],
          message: null
      );
      print(apiResponse.data);
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }
}