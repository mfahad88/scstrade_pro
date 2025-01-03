import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/Utils.dart';

class MainViewModel extends ChangeNotifier{


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

  MainViewModel(){
    startTimer();
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