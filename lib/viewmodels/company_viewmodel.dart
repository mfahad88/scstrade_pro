import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/snapshot/Overview.dart';
import 'package:scstrade_pro/repositories/company_repository.dart';

import '../models/data/mock_data.dart';

class CompanyViewModel extends ChangeNotifier{
  CompanyViewModel(this.companyRepository);
  final CompanyRepository companyRepository;
  ApiResponse<Overview?> apiResponseOverview=ApiResponse(status: Status.loading);
  List<String> header=['Overview','Profile','Fundamental','Annual Statement'];
  int _currentIndex=0;
  int get currentIndex => _currentIndex;
  bool isLoading=true;
  Map<String,String> mktCap={
    'Last Trade Vol:':'3',
    'Total Volume:':'48,833,867',
    'Upper Cap:':'15.94',
    'Last Trade Time:':'12:21:29',
    'Total Trade:':'11,895',
    'Lower Lock:':'15.94',
  };
  Map<String,String> companySnapShot={
    'Authorized Capital':'1,500,000,000',
    'Avg Volume 12M':'45,417,560',
    'Beta':'1.75',
    'Face Value':'10',
    'Free Float':'3,985,831.369',
    'Free Float Per':'336',
    'Market Cap':'3,985,831.369',
    'One Month High':'1.92',
    'One Month Low':'1.20',
    'One Month Return':'21.77',
    'Paid Up Capital':'11,850,600',
    'Six Month High':'1.92',
    'Six Month Low':'1.15',
    'Six Month Return':'42.32',
    'Paid Up Capital':'42.00'
  };
  bool isLineSelected=false;
  bool isCandleSelected=true;
  List<String> mins=['1min','5min','15min','30min','1h'];
  String selectedMins='';
  final List<CandleData> candleData = MockDataTesla.candles;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }



  Future<void> fetchSnapshotOverview(String symbol) async {
    try{
      bool isLoading=true;
      notifyListeners();
      apiResponseOverview=await companyRepository.fetchSnapshotOverview(symbol);
    }catch (e){
      print('Error: $e');
    }finally{
      bool isLoading=false;
      notifyListeners();
    }
  }

  void toggleChart(String v){
    isLineSelected=!isLineSelected;
    isCandleSelected=!isCandleSelected;
    notifyListeners();
  }

  void toggleMins(String v){
    selectedMins=v;
    notifyListeners();
  }
}