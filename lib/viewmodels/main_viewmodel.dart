import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:scstrade_pro/models/indices/Indices.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/services/api_client.dart';

import '../helper/Utils.dart';
import '../models/data/mock_data.dart';
import '../models/response/api_response.dart';

class MainViewModel extends ChangeNotifier{
  final ApiClient apiClient;
  ApiResponse<List<IndicesSummary>?>apiResponseSummary=ApiResponse<List<IndicesSummary>>(status: Status.loading);
  ApiResponse<List<Indices>?> apiResponseIndex=ApiResponse<List<Indices>>(status: Status.loading);
  List<String> sideMenus=['Indices','All Stocks','Detailed Quote','Fundamental', 'Technical','SCS Portfolio','Announcements'];
  List<String> imageMenus=['images/Group 49.png','images/Group 51.png','images/Group 52.png','images/Group 53.png','images/Group 54.png','images/Group 55.png','images/Group 56.png'];
  final List<CandleData> candleData = MockDataTesla.candles;
  final Map<String,String> menus={
    'Watchlist':'images/group_watchlist.png',
    'Market':'images/group_market.png',
    'Home':'images/group_home.png',
    'News':'images/group_news.png',
    'More':'images/group_more.png',
  };
  String _selectedMenu='Home';
  Timer? _timer;
  String? currentTime;
  bool isLineSelected=false;
  bool isCandleSelected=true;
  List<String> mins=['1min','5min','15min','30min','1h'];
  String selectedMins='';
  String _selectedIndex='';
  String _selectedDropDown='';
  String get selectedDropDown => _selectedDropDown;

  set selectedDropDown(String value) {
    _selectedDropDown = value;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => notifyListeners(),);
  }

  String get selectedIndex => _selectedIndex;

  set selectedIndex(String value) {
    _selectedIndex = value;
    notifyListeners();
  }

  set selectedMenu(String value) {
    _selectedMenu = value;
    notifyListeners();
  }


  String get selectedMenu => _selectedMenu;
  void startTimer(){
    _timer=Timer.periodic(const Duration(minutes: 1), (timer) {
      currentTime=Utils.dateFormatter(dateTime: DateTime.now(), format: 'dd MMM yyyy | hh:mm a');
      // print('Current Time: $currentTime');
      notifyListeners();
    },);
  }
  void stopTimer(){
    _timer?.cancel();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  MainViewModel(this.apiClient);

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