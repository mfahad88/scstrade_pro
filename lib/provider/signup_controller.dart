import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier{
  int _counter = 1;
  String _fullName="";
  String _gender="";
  String _dob="";
  String _living="";
  String _saving="";
  String _company="";
  String _occuption="";
  TextEditingController textEditingControllerDob = TextEditingController(text: "");
  // TextEditingController textEditingControllerPob = TextEditingController(text: "");
  // TextEditingController textEditingControllerCompany = TextEditingController(text: "");
  // TextEditingController textEditingControllerOccuption = TextEditingController(text: "");

  String _pob="";
  double _percent=0.0;
  GlobalKey<NavigatorState> mainNavigation = GlobalKey();
  String get fullName => _fullName;
  String get living => _living;
  String get gender => _gender;
  String get dob => _dob;
  String get pob => _pob;
  String get saving => _saving;
  String get company => _company;
  String get occuption => _occuption;
  double get percent => _percent;
  int get counter => _counter;

  set occuption(String occuption){
    _occuption = occuption;
    notifyListeners();
  }
  set company(String company){
    _company = company;
    notifyListeners();
  }
  set saving(String saving){
    _saving = saving;
    notifyListeners();
  }
  set counter(int counter){
    _counter=counter;
    notifyListeners();
  }
  set living(String living){
    _living=living;
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
    _percent+=0.04;
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