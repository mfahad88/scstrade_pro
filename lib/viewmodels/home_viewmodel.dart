import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';

import '../models/data/mock_data.dart';

class HomeViewModel extends ChangeNotifier{
  bool isLineSelected=false;
  bool isCandleSelected=true;
  List<String> mins=['1min','5min','15min','30min','1h'];
  String selectedMins='';

  String _selectedIndex='';
  Map<String,String> map={
    'selectedIndex':'',
    'currentValue':'',
    'volume':'',
    'change':'',
    'high':'',
    'low':'',
  };
  final List<CandleData> candleData = MockDataTesla.candles;
  final AlldataViewmodel alldataViewmodel;
  final IndicesViewModel indicesViewModel;
  Timer? _timer;
  HomeViewModel({required this.alldataViewmodel, required this.indicesViewModel}){
    startTimer();
  }



  void toggleChart(String v){
    isLineSelected=!isLineSelected;
    isCandleSelected=!isCandleSelected;
    notifyListeners();
  }

  void toggleMins(String v){
    selectedMins=v;
    notifyListeners();
  }

  Future<void> fetchIndices() async {
    indicesViewModel.fetchIndices().then((value) {
      var response=indicesViewModel.apiResponseSummary;
      selectedOption(map['selectedIndex']?.isEmpty??false?response.data?.first:
          response.data?.where((element) => element.indexcode?.replaceAll('Index', '')==map['selectedIndex'],).toList().first
      );
      // selectedDropDown=response.data?.first.indexcode??'';
    },);

  }

  void selectedOption(IndicesSummary? s) {
    var currentIndex=double.parse(s?.currentindex??'0.0');
    var previousIndex=double.parse(s?.preClose.toString()??'0.0');
    var changeIndex=double.parse(s?.netchange??'0.0');
    var changePercent=(changeIndex/previousIndex)*100;
    var highPointChange=double.parse(s?.highindex??'0.0') - previousIndex;
    var highPercent = (highPointChange/previousIndex)*100;
    var lowPointChange=previousIndex - double.parse(s?.netchange??'0.0') ;
    var lowPercent = (lowPointChange/previousIndex)*100;
    map['selectedIndex']=s?.indexcode?.replaceAll('Index', '')??'';
    map['currentValue']=Utils.formatToMillions(double.parse(s?.valuetraded??'0.0'));
    map['volume']=Utils.formatToMillions(double.parse(s?.volumetraded??'0.0'));
    map['high']='${s?.highindex??''} ${Utils.roundTwoDecimal(highPointChange)} (${Utils.roundTwoDecimal(highPercent)}%)';
    map['low']='${s?.lowindex??''} ${Utils.roundTwoDecimal(lowPointChange)} (${Utils.roundTwoDecimal(lowPercent)}%)';
    map['change']='${changeIndex} (${Utils.roundTwoDecimal(changePercent)}%)';
    notifyListeners();
  }

  void startTimer() {
    _timer=Timer.periodic(Duration(seconds: 5), (timer) => fetchIndices(),);
  }

  @override
  void dispose() {
    stopTimer();
    print('Disposed');
    super.dispose();
  }

  void stopTimer() {
    _timer?.cancel();
  }
}