import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:scstrade_pro/models/KeyDescValue.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/snapshot/Overview.dart';
import 'package:scstrade_pro/repositories/company_repository.dart';

import '../models/data/mock_data.dart';

class CompanyViewModel extends ChangeNotifier{
  CompanyViewModel(this.companyRepository);
  final CompanyRepository companyRepository;
  ApiResponse<Overview?> apiResponseOverview=ApiResponse(status: Status.loading);
  List<String> header=['Overview','Profile','Financials'];
  int _currentIndex=0;
  int _selectedRatio=0;

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
  Map<String,String> companyOverview={
    'name':'Fauji Foods Limited',
    'sn':'Food & Personal Care Products',
    'company_logo':'images/company_icon.png',
    'stockPrice':'218.80',
    'stockPricePercent':'0.62 (3.28%)',
    'volume':'2,548,950',
    'marketCap':'941.04 bn',
    'avgVolume':'8,616,226',
    'index':'KSE100'
  };
  var days=['Day\'s Range','1 Month Range','6 Month Range','52 Week\'s Range'];
  Map<String,BarChartGroupData> performance={
    '1 Month':BarChartGroupData(x: 0,barRods: [BarChartRodData(toY: 8.06,color: Color(0xFF1A73E8),width: 52,borderRadius: BorderRadius.circular(0.0))]),
    '3 Month':BarChartGroupData(x: 1,barRods: [BarChartRodData(toY: 24.93,color: Color(0xFF1A73E8),width: 52,borderRadius: BorderRadius.circular(0.0))]),
    '6 Month':BarChartGroupData(x: 2,barRods: [BarChartRodData(toY: 62.77,color: Color(0xFF1A73E8),width: 52,borderRadius: BorderRadius.circular(0.0))]),
    '1 Year':BarChartGroupData(x: 3,barRods: [BarChartRodData(toY: 73.82,color: Color(0xFF1A73E8),width: 52,borderRadius: BorderRadius.circular(0.0))]),
  };
  var financialSummary={
    'Paid Up Capital': '43,009.28 mn',
    'Authorized Capital': '50,000.00 mn',
    'Total No. Shares': '4,300.93 mn',
    'Free Float': '645.14 mn',
    'Beta': '1.49',
    'Facevalue': '10.00',
    'Free Float %': '15.00 %',
    'Year End': 'June',
    'Market Cap': '948.40 bn'
  };
  var eps={
    '2017':BarChartGroupData(x: 0,barRods: [BarChartRodData(toY: 14.83,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2018':BarChartGroupData(x: 1,barRods: [BarChartRodData(toY: 18.31,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2019':BarChartGroupData(x: 2,barRods: [BarChartRodData(toY: 27.53,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2020':BarChartGroupData(x: 3,barRods: [BarChartRodData(toY: 23.27,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2021':BarChartGroupData(x: 4,barRods: [BarChartRodData(toY: 21.28,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2022':BarChartGroupData(x: 5,barRods: [BarChartRodData(toY: 31.11,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2023':BarChartGroupData(x: 6,barRods: [BarChartRodData(toY: 52.23,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
    '2024':BarChartGroupData(x: 7,barRods: [BarChartRodData(toY: 48.59,color: Color(0xFF136E00),width: 18,borderRadius: BorderRadius.circular(0.0))]),
  };
  
  var quaterlyEps={
    '2021':BarChartGroupData(x:0,
      barRods: [
        BarChartRodData(toY: 5.45,color: Color(0xFF7cb5ec),width: 10,borderRadius: BorderRadius.circular(0.0)),
        BarChartRodData(toY: 1.45,color: Color(0xFF434348),width: 10,borderRadius: BorderRadius.circular(0.0)),
        BarChartRodData(toY: 0.45,color: Color(0xFF90ed7d),width: 10,borderRadius: BorderRadius.circular(0.0)),
        BarChartRodData(toY: 0.45,color: Color(0xFFf7a35c),width: 10,borderRadius: BorderRadius.circular(0.0))
      ]
    ),
    '2022':BarChartGroupData(x:0,
        barRods: [
          BarChartRodData(toY: 7.82,color: Color(0xFF7cb5ec),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 7.82,color: Color(0xFF434348),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 10.03,color: Color(0xFF90ed7d),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 5.06,color: Color(0xFFf7a35c),width: 10,borderRadius: BorderRadius.circular(0.0))
        ]
    ),

    '2023':BarChartGroupData(x:0,
        barRods: [
          BarChartRodData(toY: 7.82,color: Color(0xFF7cb5ec),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 7.82,color: Color(0xFF434348),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 10.03,color: Color(0xFF90ed7d),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 5.06,color: Color(0xFFf7a35c),width: 10,borderRadius: BorderRadius.circular(0.0))
        ]
    ),
    '2024':BarChartGroupData(x:0,
        barRods: [
          BarChartRodData(toY: 7.82,color: Color(0xFF7cb5ec),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 7.82,color: Color(0xFF434348),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 10.03,color: Color(0xFF90ed7d),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 5.06,color: Color(0xFFf7a35c),width: 10,borderRadius: BorderRadius.circular(0.0))
        ]
    ),
    '2025':BarChartGroupData(x:0,
        barRods: [
          BarChartRodData(toY: 9.54,color: Color(0xFF7cb5ec),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 0.0,color: Color(0xFF434348),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 0.0,color: Color(0xFF90ed7d),width: 10,borderRadius: BorderRadius.circular(0.0)),
          BarChartRodData(toY: 0.0,color: Color(0xFFf7a35c),width: 10,borderRadius: BorderRadius.circular(0.0))
        ]
    ),
  };
  Map<String,Map<String,String>> earnings={
    'Latest EPS':{'Upto 2025 1Q ':'Rs. 9.541'},
    'Latest EPS1':{'Upto 2025 2Q ':'Rs. 9.542'},
    'Latest EPS2':{'Upto 2025 3Q ':'Rs. 9.543'},
    'Latest EPS3':{'Upto 2025 4Q ':'Rs. 9.544'},
    'Latest EPS4':{'Upto 2025 5Q ':'Rs. 9.545'},
    'Latest EPS5':{'Upto 2025 6Q ':'Rs. 9.546'},
    'Latest EPS6':{'Upto 2025 7Q ':'Rs. 9.547'},
  };
  Map<String,Map<String,String>> impRatios={
    'Gross Margin1':{'Upto 2025 1Q ':'Rs. 9.541'},
  'Gross Margin2':{'Upto 2025 1Q ':'Rs. 9.541'},
  'Gross Margin3':{'Upto 2025 1Q ':'Rs. 9.541'},
  'Gross Margin4':{'Upto 2025 1Q ':'Rs. 9.541'},
  };

  Map<String,List<KeyDescValue>> equityRatios={
    'Equity Ratios':[
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
      KeyDescValue('Book Value', 'Upto 2025 1Q', 'Rs.300.26'),
    ]
  };
  bool isLineSelected=false;
  bool isCandleSelected=true;

  int get currentIndex => _currentIndex;


  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }


  int get selectedRatio => _selectedRatio;

  set selectedRatio(int value) {
    _selectedRatio = value;
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


}