import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/network/api_client.dart';

import '../../../data/dto/kse_indices.dart';

class LoginViewModel extends ChangeNotifier{
  List<KseIndices>? prev_indices;
  List<KseIndices>? indices;
  String errorMessage='';
  String _selectedValue='';
  int selectedIndex=0;
  bool _obscureText=true;
  bool isLoading=false;
  bool get obscureText => _obscureText;
  bool _isChecked=false;
  String _dailyPercentChange='';
  String _dailyChange='';
  String get dailyPercentChange => _dailyPercentChange;

  String get dailyChange => _dailyChange;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }


  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    double currentIndex=double.parse(indices?.where((element) => element.indexCode==value,).first.currentIndex??'0.0');
    double previousClose=indices?.where((element) => element.indexCode==value,).first.preClose??0.0;
    _dailyPercentChange='${Utils.roundTwoDecimal(((currentIndex - previousClose)*100)/previousClose)} %';
    _dailyChange = Utils.roundTwoDecimal(currentIndex- previousClose).contains('-')?'${Utils.roundTwoDecimal(currentIndex- previousClose)}':'+${Utils.roundTwoDecimal(currentIndex- previousClose)}';
    notifyListeners();
  }

  Future<void> fetchIndices() async {
    try{
      if(indices?.isEmpty??true) {
        isLoading = true;
      }
      prev_indices=indices;
      indices=await ApiClient.fetchIndices();
      selectedValue = selectedValue.isEmpty?indices?.first.indexCode??"":selectedValue;
      errorMessage='';
    }catch(e){
      errorMessage=e.toString();
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  Future<dynamic> signInWithGoogle() async {
    signOutFromGoogle().then((value) async {
      try {

        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        var user= await FirebaseAuth.instance.signInWithCredential(credential);
        print('User: $user');
        return user;
      } on Exception catch (e) {
        // TODO
        print('exception->$e');
      }
    },);
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}