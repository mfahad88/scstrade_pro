import 'Eps.dart';
import 'EpsYear.dart';
import 'BookValue.dart';
import 'Roaroe.dart';
import 'StockIndex.dart';
import 'Dividend.dart';
import 'Payout.dart';
import 'Cash.dart';
import 'Insurance.dart';

/// EPS : {"ChartName":"Quarterly Earning Per Share PKR","Year":["2020","2021","2022","2023","2024"],"Q1":[-2.26,4.78,5.47,5.03,5.47],"Q2":[18.42,6.55,5.62,2.6899999999999995,6.7],"Q3":[6.370000000000001,2.6099999999999994,3.7699999999999996,7.05,5.15],"Q4":[10.519999999999996,6.610000000000001,5.789999999999999,8.21,0]}
/// EPSYear : {"ChartName":"Earning Per Share PKR","Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"Earning_Per_Share":[22.98,20.65,20.55,33.05,25.49,30.64,41.12,26.57]}
/// BookValue : {"Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"Book_Value_PKR":[152.99,138.92,149.76,147.51,130.7,130.36,117.44,96.62],"Price_To_Book_Value_X":[0.78,1.23,2.12,2.48,2.65,5.11,6.04,5.35]}
/// ROAROE : {"ChartName":"Percentage %","Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"Return_On_Equity":[15.02,14.86,13.72,22.41,19.5,23.5,35.01,27.5],"Return_On_Assets":[1.12,1.1,0.94,1.51,1.28,1.74,2.71,2.05],"Return_On_CE":[0,0,0,0,0,0,0,0]}
/// StockIndex : {"ChartName":"Index Vs Stocks","Date":[null,"Jul","Jul","Jul","Jul","Jul","Jul","Jul","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Aug","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Sep","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Oct","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Nov","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Dec","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan","Jan"],"Stock":[129.99,127.81,127.58,127.01,125.59,129,129.82,129.82,127.59,127.6,126.32,126.32,131.53,130,129.88,127.05,128.05,128,126.79,126.9,130.97,129,130.33,129.37,125.83,125.25,121.6,122.81,121.02,122.42,123,124.81,124.32,122.06,123,123,122,121,123.94,122.5,123.08,121,124,122.99,123,122,121.7,122.93,123,123,123,121,123.09,128.04,128.24,131.94,129.27,129.74,129.99,131.9,131.9,129.81,127.17,129,133.47,136.13,134,129.88,129.18,128.52,127.96,130,128.79,128,128.99,128.5,132,130,137.83,139.67,146.53,143.13,145.23,149.92,146.05,141,143.3,137.09,141,155.1,155.51,160.27,158.91,163.98,180.38,183.9,186.99,176.69,184.97,183.1,177.61,180,180.74,178.5,170,170,178.98,178.87,171.76,178.44,176.97,173.22,174.01,171.55,175.23,176.86,176.39,178.25,177.15,176.41,175.51,175.5,175.5,175.17,175.17],"Index":[129.99,130.73,131.41,129.87,129.14,130.46,130.13,128.9,129.46,127.57,127.75,127.62,128.88,130.03,129.05,128.88,129.26,129.16,128.8,128.66,129.51,130.39,130.4,130.02,129.21,129.06,129.65,129.88,129.54,129.66,130.47,130.5,130.56,130.09,131.2,130.15,130.76,131.28,131.54,133.15,134.8,135.82,135.45,134.84,136.1,135.12,134.51,134.22,135.36,135.63,136.88,138.22,140.5,141.75,141.76,141.4,141.45,141.08,142.04,142.64,141.61,142.39,143.07,144.27,147.17,148.9,149.23,150.34,149.38,147.2,150.33,152.11,152.72,152.25,153.08,154.36,154.95,154.25,154.47,155.85,156.8,157.18,158.6,158.09,161.04,161.82,162.29,156.49,164.26,165.61,167.72,170.89,173.01,173.91,179.1,180.45,181.97,180.19,183.36,188.94,189.14,192.23,190.06,183.79,175.86,181.22,188.52,186.02,182.72,184.26,190.73,190.51,193.62,193.8,194.57,192.37,192.04,188.89,186.39,187.4,189.03,189.98,189.47,188.38,190.76]}
/// Dividend : {"Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"Dividend_Yield_Per":[10.93,7.61,4.58,4.51,4.76,2.63,2.47,2.81],"Dividend":[13,13,14.5,16.5,16.5,17.5,17.5,14.5]}
/// Payout : {"ChartName":"Payout Ration %","Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"Payout_Ratio":[56.57,62.96,70.57,49.92,64.73,57.12,42.56,54.57]}
/// Sales : null
/// Enterprise : null
/// Profitablity : null
/// Cash : {"ChartName":"Cash Per Share PKR","Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"Cash_Per_Share":[39.11,41.55,35.29,56.65,46.93,71.52,61.68,55.52],"Cash_Flow_Per_Share":[60.04,120.27,279.95,204.48,142.61,294.63,108.32,76.31]}
/// ADR : null
/// Insurance : {"ChartName":"Percentage %","Year":["2023","2022","2021","2020","2019","2018","2017","2016"],"UWR_To_PAT":[1911.58,2199.33,2888.16,1980.92,3091.69,0,0,0],"II_To_PAT":[1331.74,920.84,684.55,416.89,566.12,1.72,182.71,21.98]}

class Chart {
  Chart({
      Eps? eps, 
      EpsYear? ePSYear, 
      BookValue? bookValue, 
      Roaroe? roaroe, 
      StockIndex? stockIndex, 
      Dividend? dividend, 
      Payout? payout, 
      dynamic sales, 
      dynamic enterprise, 
      dynamic profitablity, 
      Cash? cash, 
      dynamic adr, 
      Insurance? insurance,}){
    _eps = eps;
    _ePSYear = ePSYear;
    _bookValue = bookValue;
    _roaroe = roaroe;
    _stockIndex = stockIndex;
    _dividend = dividend;
    _payout = payout;
    _sales = sales;
    _enterprise = enterprise;
    _profitablity = profitablity;
    _cash = cash;
    _adr = adr;
    _insurance = insurance;
}

  Chart.fromJson(dynamic json) {
    _eps = json['EPS'] != null ? Eps.fromJson(json['EPS']) : null;
    _ePSYear = json['EPSYear'] != null ? EpsYear.fromJson(json['EPSYear']) : null;
    _bookValue = json['BookValue'] != null ? BookValue.fromJson(json['BookValue']) : null;
    _roaroe = json['ROAROE'] != null ? Roaroe.fromJson(json['ROAROE']) : null;
    _stockIndex = json['StockIndex'] != null ? StockIndex.fromJson(json['StockIndex']) : null;
    _dividend = json['Dividend'] != null ? Dividend.fromJson(json['Dividend']) : null;
    _payout = json['Payout'] != null ? Payout.fromJson(json['Payout']) : null;
    _sales = json['Sales'];
    _enterprise = json['Enterprise'];
    _profitablity = json['Profitablity'];
    _cash = json['Cash'] != null ? Cash.fromJson(json['Cash']) : null;
    _adr = json['ADR'];
    _insurance = json['Insurance'] != null ? Insurance.fromJson(json['Insurance']) : null;
  }
  Eps? _eps;
  EpsYear? _ePSYear;
  BookValue? _bookValue;
  Roaroe? _roaroe;
  StockIndex? _stockIndex;
  Dividend? _dividend;
  Payout? _payout;
  dynamic _sales;
  dynamic _enterprise;
  dynamic _profitablity;
  Cash? _cash;
  dynamic _adr;
  Insurance? _insurance;

  Eps? get eps => _eps;
  EpsYear? get ePSYear => _ePSYear;
  BookValue? get bookValue => _bookValue;
  Roaroe? get roaroe => _roaroe;
  StockIndex? get stockIndex => _stockIndex;
  Dividend? get dividend => _dividend;
  Payout? get payout => _payout;
  dynamic get sales => _sales;
  dynamic get enterprise => _enterprise;
  dynamic get profitablity => _profitablity;
  Cash? get cash => _cash;
  dynamic get adr => _adr;
  Insurance? get insurance => _insurance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_eps != null) {
      map['EPS'] = _eps?.toJson();
    }
    if (_ePSYear != null) {
      map['EPSYear'] = _ePSYear?.toJson();
    }
    if (_bookValue != null) {
      map['BookValue'] = _bookValue?.toJson();
    }
    if (_roaroe != null) {
      map['ROAROE'] = _roaroe?.toJson();
    }
    if (_stockIndex != null) {
      map['StockIndex'] = _stockIndex?.toJson();
    }
    if (_dividend != null) {
      map['Dividend'] = _dividend?.toJson();
    }
    if (_payout != null) {
      map['Payout'] = _payout?.toJson();
    }
    map['Sales'] = _sales;
    map['Enterprise'] = _enterprise;
    map['Profitablity'] = _profitablity;
    if (_cash != null) {
      map['Cash'] = _cash?.toJson();
    }
    map['ADR'] = _adr;
    if (_insurance != null) {
      map['Insurance'] = _insurance?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'Chart{_eps: $_eps, _ePSYear: $_ePSYear, _bookValue: $_bookValue, _roaroe: $_roaroe, _stockIndex: $_stockIndex, _dividend: $_dividend, _payout: $_payout, _sales: $_sales, _enterprise: $_enterprise, _profitablity: $_profitablity, _cash: $_cash, _adr: $_adr, _insurance: $_insurance}';
  }
}