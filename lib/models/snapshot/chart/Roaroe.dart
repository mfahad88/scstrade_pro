/// ChartName : "Percentage %"
/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// Return_On_Equity : [15.02,14.86,13.72,22.41,19.5,23.5,35.01,27.5]
/// Return_On_Assets : [1.12,1.1,0.94,1.51,1.28,1.74,2.71,2.05]
/// Return_On_CE : [0,0,0,0,0,0,0,0]

class Roaroe {
  Roaroe({
      String? chartName, 
      List<String>? year, 
      List<num>? returnOnEquity, 
      List<num>? returnOnAssets, 
      List<num>? returnOnCE,}){
    _chartName = chartName;
    _year = year;
    _returnOnEquity = returnOnEquity;
    _returnOnAssets = returnOnAssets;
    _returnOnCE = returnOnCE;
}

  Roaroe.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _returnOnEquity = json['Return_On_Equity'] != null ? json['Return_On_Equity'].cast<num>() : [];
    _returnOnAssets = json['Return_On_Assets'] != null ? json['Return_On_Assets'].cast<num>() : [];
    _returnOnCE = json['Return_On_CE'] != null ? json['Return_On_CE'].cast<num>() : [];
  }
  String? _chartName;
  List<String>? _year;
  List<num>? _returnOnEquity;
  List<num>? _returnOnAssets;
  List<num>? _returnOnCE;

  String? get chartName => _chartName;
  List<String>? get year => _year;
  List<num>? get returnOnEquity => _returnOnEquity;
  List<num>? get returnOnAssets => _returnOnAssets;
  List<num>? get returnOnCE => _returnOnCE;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    map['Year'] = _year;
    map['Return_On_Equity'] = _returnOnEquity;
    map['Return_On_Assets'] = _returnOnAssets;
    map['Return_On_CE'] = _returnOnCE;
    return map;
  }

}