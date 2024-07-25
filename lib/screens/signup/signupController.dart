import 'package:flutter/material.dart';

class Signupcontroller extends ChangeNotifier{
  String _fullName="";
  String _gender="";
  String _dob="";
  String _pob="";
  double _percent=0.0;
  GlobalKey<NavigatorState> mainNavigation = GlobalKey();
  String get fullName => _fullName;
  String get gender => _gender;
  String get dob => _dob;
  String get pob => _pob;
  double get percent => _percent;

  void addPercent(){
    _percent+=0.1;
    notifyListeners();
  }
  set setFullName(String fullName){
    _fullName = fullName;

    notifyListeners();
  }

  set gender(String gender){
    this._gender = gender;
    notifyListeners();
  }

  set dob(String dob){
    this._dob = dob;

    notifyListeners();
  }

  set pob(String pob){
    this._pob = pob;
    notifyListeners();
  }

}