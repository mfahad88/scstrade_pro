import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier{
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  set isExpanded(bool value) {
    _isExpanded = value;
    notifyListeners();
  }
}