import 'package:flutter/material.dart';

class Signupcontroller extends ChangeNotifier{
  int _counter = 1;
  String _fullName="";
  String _gender="";
  String _dob="";
  TextEditingController textEditingControllerDob = TextEditingController(text: "");
  String _pob="";
  double _percent=0.0;
  GlobalKey<NavigatorState> mainNavigation = GlobalKey();
  String get fullName => _fullName;
  String get gender => _gender;
  String get dob => _dob;
  String get pob => _pob;
  double get percent => _percent;
  int get counter => _counter;
  set counter(int counter){
    _counter=counter;
    notifyListeners();
  }
  void addCounter(){
    _counter++;
    notifyListeners();
  }

  void decCounter(){
    _counter--;
    notifyListeners();
  }
  void addPercent(){
    _percent+=0.1;
    notifyListeners();
  }
  set fullName(String fullName){
    _fullName = fullName;

    notifyListeners();
  }

  set gender(String gender){
    _gender = gender;
    notifyListeners();
  }

  set dob(String dob){
    _dob = dob;
    textEditingControllerDob.text = dob;
    notifyListeners();
  }

  set pob(String pob){
    _pob = pob;
    notifyListeners();
  }

}