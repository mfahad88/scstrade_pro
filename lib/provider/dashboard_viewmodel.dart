import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scstrade_pro/models/daily_notification.dart';

import '../models/MyStock.dart';

class DashboardViewmodel extends ChangeNotifier{
  int _selectedIndex=0;
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

/*  void getStocks(String? value){
    if(value=="") {
      listStock([
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
      ]);
    }else{
      listStock([
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
      ].where((element) => element.title.toLowerCase().contains(value!.toLowerCase()),).toList());
    }

  }*/

}