import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scstrade_pro/models/allData/Alldata_indices.dart';
import 'package:scstrade_pro/models/indices/Indices.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/snapshot/Overview.dart';

import '../models/snapshot/chart/Chart.dart';
import '../models/snapshot/detail/Detail.dart';
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


  Future<ApiResponse<List<AlldataIndices>>> fetchAllData() async{
    try{


      return compute((message) async {
        final response=await http.get(Uri.parse('$baseUrl/Data?que=AllData'));

        List body = jsonDecode(response.body);
        ApiResponse<List<AlldataIndices>> apiResponse=ApiResponse<List<AlldataIndices>>(
            status: Status.completed,
            data: body.map((e) => AlldataIndices.fromJson(e),).toList(),
            message: null
        );
        print(apiResponse);
        return apiResponse;
      }, '');
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
      ApiResponse<String> apiResponse=ApiResponse<String>(status: null);
      final response=await http.get(Uri.parse('$baseUrl/Data?que=Registration|$name|$email|$mobileNo'));
      print(response.request);
      List body = jsonDecode(response.body);

      apiResponse=ApiResponse<String>(
          status: Status.completed,
          data: body.first['Status'],
          message: null
      );
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<List<IndicesSummary>>> fetchIndices() async {
    try{
      ApiResponse<List<IndicesSummary>> apiResponse=ApiResponse<List<IndicesSummary>>(status: null);
      final response=await http.get(Uri.parse('$baseUrl/Data?que=KSE%20Indices'));
      print(response.request);
      List body = jsonDecode(response.body);

      apiResponse=ApiResponse<List<IndicesSummary>>(
          status: Status.completed,
          data: body.map((e) => IndicesSummary.fromJson(e),).toList(),
          message: null
      );
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<List<Indices>>> fetchByIndex(String query) async {
    try{
      ApiResponse<List<Indices>> apiResponse=ApiResponse<List<Indices>>(status: null);
      final response=await http.get(Uri.parse('$baseUrl/Data?que=$query'));
      print(response.request);
      List body = jsonDecode(response.body);

      apiResponse=ApiResponse<List<Indices>>(
          status: Status.completed,
          data: body.map((e) => Indices.fromJson(e),).toList(),
          message: null
      );
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<Overview>> fetchSnapshotOverview(String symbol) async {
    try{
      ApiResponse<Overview> apiResponse=ApiResponse<Overview>(status: null);
      final response=await http.get(Uri.parse('$baseUrl/SnapOverview?symbolin=$symbol'));
      print(response.request);
      var body = jsonDecode(response.body);
      apiResponse=ApiResponse<Overview>(
          status: Status.completed,
          data: Overview.fromJson(body),
          message: null
      );
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<dynamic>> fetchSnapshotChart(String symbol) async {
    try{
      ApiResponse<dynamic> apiResponse=ApiResponse<dynamic>(status: null);
      final response=await http.get(Uri.parse('$baseUrl/SnapCharting?symbolin=$symbol'));

      var body = jsonDecode(response.body);
      // print('Request:${response.request}\n\nResponse: ${response.body}');
      apiResponse=ApiResponse<dynamic>(
          status: Status.completed,
          data: body,
          message: null
      );
      print('Response: ${apiResponse.data}');
      return apiResponse;
    }catch(e){
      return ApiResponse(
          status: Status.error,
          data: null,
          message: 'Something went wrong.\nPlease try again later...'
      );
    }
  }

  Future<ApiResponse<List<Detail>>> fetchSnapshotDetail(String symbol) async {
    try{
      ApiResponse<List<Detail>> apiResponse=ApiResponse<List<Detail>>(status: null);
      final response=await http.get(Uri.parse('$baseUrl/SnapDetails?symbolin=$symbol'));
      print(response.request);
      List body = jsonDecode(response.body);

      apiResponse=ApiResponse<List<Detail>>(
          status: Status.completed,
          data: body.map((e) => Detail.fromJson(e),).toList(),
          message: null
      );
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