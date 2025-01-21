/// ChartName : "Percentage %"
/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// UWR_To_PAT : [1911.58,2199.33,2888.16,1980.92,3091.69,0,0,0]
/// II_To_PAT : [1331.74,920.84,684.55,416.89,566.12,1.72,182.71,21.98]

class Insurance {
  Insurance({
      String? chartName, 
      List<String>? year, 
      List<num>? uWRToPAT, 
      List<num>? iIToPAT,}){
    _chartName = chartName;
    _year = year;
    _uWRToPAT = uWRToPAT;
    _iIToPAT = iIToPAT;
}

  Insurance.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _uWRToPAT = json['UWR_To_PAT'] != null ? json['UWR_To_PAT'].cast<num>() : [];
    _iIToPAT = json['II_To_PAT'] != null ? json['II_To_PAT'].cast<num>() : [];
  }
  String? _chartName;
  List<String>? _year;
  List<num>? _uWRToPAT;
  List<num>? _iIToPAT;

  String? get chartName => _chartName;
  List<String>? get year => _year;
  List<num>? get uWRToPAT => _uWRToPAT;
  List<num>? get iIToPAT => _iIToPAT;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    map['Year'] = _year;
    map['UWR_To_PAT'] = _uWRToPAT;
    map['II_To_PAT'] = _iIToPAT;
    return map;
  }

}