/// ChartName : "Earning Per Share PKR"
/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// Earning_Per_Share : [22.98,20.65,20.55,33.05,25.49,30.64,41.12,26.57]

class EpsYear {
  EpsYear({
      String? chartName, 
      List<String>? year, 
      List<num>? earningPerShare,}){
    _chartName = chartName;
    _year = year;
    _earningPerShare = earningPerShare;
}

  EpsYear.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _earningPerShare = json['Earning_Per_Share'] != null ? json['Earning_Per_Share'].cast<num>() : [];
  }
  String? _chartName;
  List<String>? _year;
  List<num>? _earningPerShare;

  String? get chartName => _chartName;
  List<String>? get year => _year;
  List<num>? get earningPerShare => _earningPerShare;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    map['Year'] = _year;
    map['Earning_Per_Share'] = _earningPerShare;
    return map;
  }

}