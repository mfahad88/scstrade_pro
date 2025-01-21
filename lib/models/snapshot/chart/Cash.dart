/// ChartName : "Cash Per Share PKR"
/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// Cash_Per_Share : [39.11,41.55,35.29,56.65,46.93,71.52,61.68,55.52]
/// Cash_Flow_Per_Share : [60.04,120.27,279.95,204.48,142.61,294.63,108.32,76.31]

class Cash {
  Cash({
      String? chartName, 
      List<String>? year, 
      List<num>? cashPerShare, 
      List<num>? cashFlowPerShare,}){
    _chartName = chartName;
    _year = year;
    _cashPerShare = cashPerShare;
    _cashFlowPerShare = cashFlowPerShare;
}

  Cash.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _cashPerShare = json['Cash_Per_Share'] != null ? json['Cash_Per_Share'].cast<num>() : [];
    _cashFlowPerShare = json['Cash_Flow_Per_Share'] != null ? json['Cash_Flow_Per_Share'].cast<num>() : [];
  }
  String? _chartName;
  List<String>? _year;
  List<num>? _cashPerShare;
  List<num>? _cashFlowPerShare;

  String? get chartName => _chartName;
  List<String>? get year => _year;
  List<num>? get cashPerShare => _cashPerShare;
  List<num>? get cashFlowPerShare => _cashFlowPerShare;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    map['Year'] = _year;
    map['Cash_Per_Share'] = _cashPerShare;
    map['Cash_Flow_Per_Share'] = _cashFlowPerShare;
    return map;
  }

}