import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:scstrade_pro/models/response/api_response.dart';

import '../models/todos/Todo.dart';

class ApiClient{
  static const baseUrl='https://dummyjson.com';
  Future<ApiResponse<Todo>> fetchTodos() async {
    try{

      final response=await http.get(Uri.parse('$baseUrl/todos'));
      final body = jsonDecode(response.body);
      return ApiResponse(
          status: Status.completed,
          data: Todo.fromJson(body),
          message: null
      );
     /* if(response.statusCode==200) {
        final body = jsonDecode(response.body);
        return ApiResponse(
          status: Status.completed,
          data: Todo.fromJson(body),
          message: null
        );
      }else{
        return ApiResponse(
            status: Status.error,
            data: null,
            message: 'Something went wrong.\nPlease try again later...'
        );
      }*/
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

}