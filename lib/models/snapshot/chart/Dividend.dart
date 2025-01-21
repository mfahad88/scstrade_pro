/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// Dividend_Yield_Per : [10.93,7.61,4.58,4.51,4.76,2.63,2.47,2.81]
/// Dividend : [13,13,14.5,16.5,16.5,17.5,17.5,14.5]

class Dividend {
  Dividend({
      List<String>? year, 
      List<num>? dividendYieldPer, 
      List<num>? dividend,}){
    _year = year;
    _dividendYieldPer = dividendYieldPer;
    _dividend = dividend;
}

  Dividend.fromJson(dynamic json) {
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _dividendYieldPer = json['Dividend_Yield_Per'] != null ? json['Dividend_Yield_Per'].cast<num>() : [];
    _dividend = json['Dividend'] != null ? json['Dividend'].cast<num>() : [];
  }
  List<String>? _year;
  List<num>? _dividendYieldPer;
  List<num>? _dividend;

  List<String>? get year => _year;
  List<num>? get dividendYieldPer => _dividendYieldPer;
  List<num>? get dividend => _dividend;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Year'] = _year;
    map['Dividend_Yield_Per'] = _dividendYieldPer;
    map['Dividend'] = _dividend;
    return map;
  }

}