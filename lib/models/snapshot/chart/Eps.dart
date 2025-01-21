/// ChartName : "Quarterly Earning Per Share PKR"
/// Year : ["2020","2021","2022","2023","2024"]
/// Q1 : [-2.26,4.78,5.47,5.03,5.47]
/// Q2 : [18.42,6.55,5.62,2.6899999999999995,6.7]
/// Q3 : [6.370000000000001,2.6099999999999994,3.7699999999999996,7.05,5.15]
/// Q4 : [10.519999999999996,6.610000000000001,5.789999999999999,8.21,0]

class Eps {
  Eps({
      String? chartName, 
      List<String>? year, 
      List<num>? q1, 
      List<num>? q2, 
      List<num>? q3, 
      List<num>? q4,}){
    _chartName = chartName;
    _year = year;
    _q1 = q1;
    _q2 = q2;
    _q3 = q3;
    _q4 = q4;
}

  Eps.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _q1 = json['Q1'] != null ? json['Q1'].cast<num>() : [];
    _q2 = json['Q2'] != null ? json['Q2'].cast<num>() : [];
    _q3 = json['Q3'] != null ? json['Q3'].cast<num>() : [];
    _q4 = json['Q4'] != null ? json['Q4'].cast<num>() : [];
  }
  String? _chartName;
  List<String>? _year;
  List<num>? _q1;
  List<num>? _q2;
  List<num>? _q3;
  List<num>? _q4;

  String? get chartName => _chartName;
  List<String>? get year => _year;
  List<num>? get q1 => _q1;
  List<num>? get q2 => _q2;
  List<num>? get q3 => _q3;
  List<num>? get q4 => _q4;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    map['Year'] = _year;
    map['Q1'] = _q1;
    map['Q2'] = _q2;
    map['Q3'] = _q3;
    map['Q4'] = _q4;
    return map;
  }

}