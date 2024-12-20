import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/repositories/login_repository.dart';

import '../models/response/api_response.dart';

class LoginViewModel extends ChangeNotifier{
  final LoginRepository loginRepository;
  ApiResponse<List<KseIndices>>? responseKseIndices=ApiResponse<List<KseIndices>>(status: Status.loading);
  List<FlSpot> spots=[
    FlSpot(0, 0.1+(Random().nextDouble()*(5.0-0.1))),
    FlSpot(1, 0.1+(Random().nextDouble()*(5.0-0.1))),
    FlSpot(2, 0.1+(Random().nextDouble()*(5.0-0.1))),
    FlSpot(3, 0.1+(Random().nextDouble()*(5.0-0.1))),
    FlSpot(4, 0.1+(Random().nextDouble()*(5.0-0.1)))
  ];
  LoginViewModel({required this.loginRepository});

  Future<void> fetchKseIndices() async {
    try{
      responseKseIndices=ApiResponse<List<KseIndices>>(status: Status.loading);

      responseKseIndices=await loginRepository.fetchKseIndices();
    }catch (e){
      print('Error: $e');
    }
    notifyListeners();
  }

}