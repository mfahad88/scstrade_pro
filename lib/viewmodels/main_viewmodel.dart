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
  final List<ButtonSegment<String>> segments= const[
    ButtonSegment(value: 'Line',label: Text('Line'),enabled: true),
    ButtonSegment(value: 'Candle',label: Text('Candle'),enabled: true),
  ];
  Set<String> _selectedChart={'Line'};

  Set<String> get selectedChart => _selectedChart;


  Timer? _timer;
  String? currentTime;
  set selectedMenu(String value) {
    _selectedMenu = value;
    notifyListeners();
  }
  set selectedChart(Set<String> value) {
    _selectedChart = value;
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
}