import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/api_service.dart';
import 'package:scstrade_pro/data/dto/KseIndex.dart';
import 'package:scstrade_pro/models/daily_notification.dart';

import '../models/MyStock.dart';


class DashboardViewmodel extends ChangeNotifier{
  DashboardViewmodel(this.apiService);
  String _dropdownSelected="";

  String get dropdownSelected => _dropdownSelected;

  set dropdownSelected(String value) {
    _dropdownSelected = value;
    notifyListeners();
  }

  ApiService apiService;
  int _selectedIndex=0;
  bool _lineSelected=true;
  bool _candleSelected=false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<KseIndex>? kseIndices;


  bool get candleSelected => _candleSelected;

  set candleSelected(bool value) {
    _candleSelected = value;
    notifyListeners();
  }

  bool _isOnemin = false;

  bool get isOnemin => _isOnemin;

  set isOnemin(bool value) {
    _isOnemin = value;
    notifyListeners();
  }
  bool _isFivemin = false;


  bool _isFifteenmin = false;
  bool _isThirtymin = false;

  bool _isOnehour = false;

  bool get lineSelected => _lineSelected;

  set lineSelected(bool value) {
    _lineSelected = value;
    notifyListeners();
  }
  int get selectedIndex => _selectedIndex;
  List<MyStock> get list => _list;
  List<MyStock> _list=[
    MyStock(image: 'images/spotify_logo.png',
        title: 'Spotify',
        shortName: 'SPOT',
        totalAmount: '\$71.05',
        profitLoss: '+ 2.94%',
        spots: [
          const FlSpot(0, 5),
          const FlSpot(1, 3.5),
          const FlSpot(2, 4),
          const FlSpot(3, 3),
          const FlSpot(4, 4),
          const FlSpot(5, 5)
        ]),
    MyStock(image: 'images/facebook_logo.png',
        title: 'Meta - Facebook',
        shortName: 'META',
        totalAmount: '\$90.79',
        profitLoss: '- 2.16%',
        spots: [
          const FlSpot(0, 5),
          const FlSpot(1, 3.5),
          const FlSpot(2, 4),
          const FlSpot(3, 3),
          const FlSpot(4, 4),
          const FlSpot(5, 5)
        ]),
    MyStock(image: 'images/tesla_logo.png',
        title: 'Tesla',
        shortName: 'TSLA',
        totalAmount: '\$207.47',
        profitLoss: '+ 2.37%',
        spots: [
          const FlSpot(0, 5),
          const FlSpot(1, 3.5),
          const FlSpot(2, 4),
          const FlSpot(3, 3),
          const FlSpot(4, 4),
          const FlSpot(5, 5)
        ]),
    MyStock(image: 'images/facebook_logo.png',
        title: 'Meta - Facebook',
        shortName: 'META',
        totalAmount: '\$90.79',
        profitLoss: '- 2.16%',
        spots: [
          const FlSpot(0, 5),
          const FlSpot(1, 3.5),
          const FlSpot(2, 4),
          const FlSpot(3, 3),
          const FlSpot(4, 4),
          const FlSpot(5, 5)
        ]),
    MyStock(image: 'images/spotify_logo.png',
        title: 'Spotify',
        shortName: 'SPOT',
        totalAmount: '\$71.05',
        profitLoss: '+ 2.94%',
        spots: [
          const FlSpot(0, 5),
          const FlSpot(1, 3.5),
          const FlSpot(2, 4),
          const FlSpot(3, 3),
          const FlSpot(4, 4),
          const FlSpot(5, 5)
        ]),
    MyStock(image: 'images/spotify_logo.png',
        title: 'Spotify',
        shortName: 'SPOT',
        totalAmount: '\$71.05',
        profitLoss: '+ 2.94%',
        spots: [
          const FlSpot(0, 5),
          const FlSpot(1, 3.5),
          const FlSpot(2, 4),
          const FlSpot(3, 3),
          const FlSpot(4, 4),
          const FlSpot(5, 5)
        ])
  ];

  List<DailyNotification> _notfications=[
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: true),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: true),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: false),
    DailyNotification(icon: 'images/security_updates.png', title: 'Security Updates!', date: 'Today | 09:24 AM', subTitle: 'Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.', isRead: true),
  ];

  List<DailyNotification> get notfications => _notfications;

  set notfications(List<DailyNotification> value) {
    _notfications = value;
  }

  set selectedIndex(int selectedIndex){
    _selectedIndex = selectedIndex;
    notifyListeners();
  }

  set list(List<MyStock> list){
    if(list.isEmpty){
      _list = [
        MyStock(image: 'images/spotify_logo.png',
            title: 'Spotify',
            shortName: 'SPOT',
            totalAmount: '\$71.05',
            profitLoss: '+ 2.94%',
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 3.5),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 5)
            ]),
        MyStock(image: 'images/facebook_logo.png',
            title: 'Meta - Facebook',
            shortName: 'META',
            totalAmount: '\$90.79',
            profitLoss: '- 2.16%',
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 3.5),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 5)
            ]),
        MyStock(image: 'images/tesla_logo.png',
            title: 'Tesla',
            shortName: 'TSLA',
            totalAmount: '\$207.47',
            profitLoss: '+ 2.37%',
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 3.5),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 5)
            ]),
        MyStock(image: 'images/facebook_logo.png',
            title: 'Meta - Facebook',
            shortName: 'META',
            totalAmount: '\$90.79',
            profitLoss: '- 2.16%',
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 3.5),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 5)
            ]),
        MyStock(image: 'images/spotify_logo.png',
            title: 'Spotify',
            shortName: 'SPOT',
            totalAmount: '\$71.05',
            profitLoss: '+ 2.94%',
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 3.5),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 5)
            ]),
        MyStock(image: 'images/spotify_logo.png',
            title: 'Spotify',
            shortName: 'SPOT',
            totalAmount: '\$71.05',
            profitLoss: '+ 2.94%',
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 3.5),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 5)
            ])
      ];
    }else {
      _list = list;
    }
    notifyListeners();
  }

  bool get isFivemin => _isFivemin;

  set isFivemin(bool value) {
    _isFivemin = value;
    notifyListeners();
  }

  bool get isFifteenmin => _isFifteenmin;

  set isFifteenmin(bool value) {
    _isFifteenmin = value;
    notifyListeners();
  }

  bool get isThirtymin => _isThirtymin;

  set isThirtymin(bool value) {
    _isThirtymin = value;
    notifyListeners();
  }

  bool get isOnehour => _isOnehour;

  set isOnehour(bool value) {
    _isOnehour = value;
    notifyListeners();
  }

  Future<List<KseIndex>> futureKseIndex() async {
    try{
      return await apiService.fetchKseIndex();
    }catch(error){
      rethrow;
    }
  }
}
