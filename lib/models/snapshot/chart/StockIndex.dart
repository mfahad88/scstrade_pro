/// ChartName : "Index Vs Stocks"
/// Date : [null,"Jul","Jul","Jul","Jul","Jul","Jul","Jul","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan"]
/// Stock : [129.99,127.81,127.58,127.01,125.59,129,129.82,129.82,127.59,127.6,126.32,126.32,131.53,130,129.88,127.05,128.05,128,126.79,126.9,130.97,129,130.33,129.37,125.83,125.25,121.6,122.81,121.02,122.42,123,124.81,124.32,122.06,123,123,122,121,123.94,122.5,123.08,121,124,122.99,123,122,121.7,122.93,123,123,123,121,123.09,128.04,128.24,131.94,129.27,129.74,129.99,131.9,131.9,129.81,127.17,129,133.47,136.13,134,129.88,129.18,128.52,127.96,130,128.79,128,128.99,128.5,132,130,137.83,139.67,146.53,143.13,145.23,149.92,146.05,141,143.3,137.09,141,155.1,155.51,160.27,158.91,163.98,180.38,183.9,186.99,176.69,184.97,183.1,177.61,180,180.74,178.5,170,170,178.98,178.87,171.76,178.44,176.97,173.22,174.01,171.55,175.23,176.86,176.39,178.25,177.15,176.41,175.51,175.5,175.5,175.17,175.17]
/// Index : [129.99,130.73,131.41,129.87,129.14,130.46,130.13,128.9,129.46,127.57,127.75,127.62,128.88,130.03,129.05,128.88,129.26,129.16,128.8,128.66,129.51,130.39,130.4,130.02,129.21,129.06,129.65,129.88,129.54,129.66,130.47,130.5,130.56,130.09,131.2,130.15,130.76,131.28,131.54,133.15,134.8,135.82,135.45,134.84,136.1,135.12,134.51,134.22,135.36,135.63,136.88,138.22,140.5,141.75,141.76,141.4,141.45,141.08,142.04,142.64,141.61,142.39,143.07,144.27,147.17,148.9,149.23,150.34,149.38,147.2,150.33,152.11,152.72,152.25,153.08,154.36,154.95,154.25,154.47,155.85,156.8,157.18,158.6,158.09,161.04,161.82,162.29,156.49,164.26,165.61,167.72,170.89,173.01,173.91,179.1,180.45,181.97,180.19,183.36,188.94,189.14,192.23,190.06,183.79,175.86,181.22,188.52,186.02,182.72,184.26,190.73,190.51,193.62,193.8,194.57,192.37,192.04,188.89,186.39,187.4,189.03,189.98,189.47,188.38,190.76]

class StockIndex {
  StockIndex({
      String? chartName, 
      List<dynamic>? date, 
      List<num>? stock, 
      List<num>? index,}){
    _chartName = chartName;
    _date = date;
    _stock = stock;
    _index = index;
}

  StockIndex.fromJson(dynamic json) {
    _chartName = json['ChartName'];
    if (json['Date'] != null) {
      _date = [];
      json['Date'].forEach((v) {
        _date?.add(json.fromJson(v));
      });
    }
    _stock = json['Stock'] != null ? json['Stock'].cast<num>() : [];
    _index = json['Index'] != null ? json['Index'].cast<num>() : [];
  }
  String? _chartName;
  List<dynamic>? _date;
  List<num>? _stock;
  List<num>? _index;

  String? get chartName => _chartName;
  List<dynamic>? get date => _date;
  List<num>? get stock => _stock;
  List<num>? get index => _index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChartName'] = _chartName;
    if (_date != null) {
      map['Date'] = _date?.map((v) => v.toJson()).toList();
    }
    map['Stock'] = _stock;
    map['Index'] = _index;
    return map;
  }

}