import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/repositories/login_repository.dart';

import '../helper/Utils.dart';
import '../models/response/api_response.dart';
import '../views/screens/otp_screen.dart';

class LoginViewModel extends ChangeNotifier{
  final LoginRepository loginRepository;
  final List<String> countryCode=['+92','+971'];
  String _selectedCountryCode='+92';
  bool _isRemember=false;

  ApiResponse<List<KseIndices>>? responseKseIndices=ApiResponse<List<KseIndices>>(status: Status.loading);
  ApiResponse<String> responseRegister=ApiResponse<String>(status: Status.loading);
  TextEditingController fullNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
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

  Future<void> submitRegister(BuildContext context) async {

    if(fullNameController.text.isNotEmpty && emailController.text.isNotEmpty && mobileController.text.isNotEmpty){
      if(isRemember){
        Utils.saveCredentials(name: fullNameController.text, email: emailController.text, mobileNo: mobileController.text);
      }
     responseRegister= await loginRepository.submitRegister(name: fullNameController.text, email: emailController.text, mobileNo: '$selectedCountryCode${mobileController.text.replaceFirst(RegExp('^0'), '')}');
      // responseRegister=ApiResponse<String>(status: Status.loading);
      // Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => OtpScreen(),));
      // Navigator.of(context).pop();
    }else{
      responseRegister=ApiResponse<String>(status: Status.error,message: 'Please check all the fields');

    }
  }

  String get selectedCountryCode => _selectedCountryCode;

  set selectedCountryCode(String value) {
    _selectedCountryCode = value;
    notifyListeners();
  }

  bool get isRemember => _isRemember;

  set isRemember(bool value) {
    _isRemember = value;
    notifyListeners();
  }
}