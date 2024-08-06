import 'package:flutter/material.dart';

class DashboardViewmodel extends ChangeNotifier{
  int _selectedIndex=0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int selectedIndex){
    _selectedIndex = selectedIndex;
    notifyListeners();
  }

}