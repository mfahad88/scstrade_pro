import 'package:flutter/material.dart';

class IntroViewModel extends ChangeNotifier{
  PageController controller=PageController(
    initialPage: 0,
  );
  int _count=0;
  var isViewed=[true,false,false];

  int get count => _count;

  set count(int value) {
    _count = value;
    notifyListeners();
  }
}