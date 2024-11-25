import 'package:flutter/material.dart';
import 'package:scstrade_pro/screens/dashboard/viewmodel/dashboard_viewmodel.dart';


class WatchListViewModel extends ChangeNotifier{
  int _selectedIndex=0;





  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;

    notifyListeners();
  }


}