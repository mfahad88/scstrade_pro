/// ChartName : "Payout Ration %"
/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// Payout_Ratio : [56.57,62.96,70.57,49.92,64.73,57.12,42.56,54.57]

class Payout {
  Payout({
      String? chartName, 
      List<String>? year, 
      List<num>? payoutRatio,}){
    _chartName = chartName;
    _year = year;
    _payoutRatio = payoutRatio;
}

  Payout.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _payoutRatio = json['Payout_Ratio'] != null ? json['Payout_Ratio'].cast<num>() : [];
  }
  String? _chartName;
  List<String>? _year;
  List<num>? _payoutRatio;

  String? get chartName => _chartName;
  List<String>? get year => _year;
  List<num>? get payoutRatio => _payoutRatio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    map['Year'] = _year;
    map['Payout_Ratio'] = _payoutRatio;
    return map;
  }

}