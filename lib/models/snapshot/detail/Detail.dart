import 'SnapShot.dart';

/// symbol : "SEARL"
/// SnapShot : {"Earnings":[{"name":"Latest EPS","value":"Rs. 0.80","desc":"Upto 2025 1Q "},{"name":"Last Annual EPS","value":"Rs. -4.65","desc":"Upto 2024 4Q"},{"name":"Price To Earning PE","value":"0.00 x","desc":"Upto 0"},{"name":"Exp Price To Earning PE","value":"33.25 x","desc":"Upto 2025 1Q "},{"name":"Exp Earning Gowth","value":"168.82 %","desc":"Upto 2025 1Q "},{"name":"Price Earning Growth","value":"0.20 x","desc":"Upto 2025 1Q "}],"Equity":[{"name":"Book Value","value":"Rs. 67.34","desc":"Upto 2024 4Q "},{"name":"Exp Book Value","value":"Rs. 70.54","desc":"Upto 2024 4Q "},{"name":"Book Value Growth","value":"8.74 %","desc":"Upto 2024 4Q"},{"name":"Exp Book Value Growth","value":"4.75 %","desc":"Upto 2024 4Q "},{"name":"Price To Book Value","value":"1.58 x","desc":"Upto 2024 4Q "},{"name":"Exp Price To Book Value","value":"1.51 x","desc":"Upto 2024 4Q "},{"name":"Return On Equity","value":"-6.90 %","desc":"Upto 2024 4Q"},{"name":"Exp Return On Equity","value":"4.54 %","desc":"Upto 2024 4Q "},{"name":"Retention Ratio","value":"0.00 %","desc":"Upto 0"},{"name":"Exp Retention Ratio","value":"0.00 %","desc":"Upto 0"},{"name":"Equity To Assets Ratio","value":"54.19 %","desc":"Upto 2024 4Q"},{"name":"Return On Assets","value":"-3.74 %","desc":"Upto 2024 4Q"},{"name":"Return On Cap Employed","value":"11.57 %","desc":"Upto 2024 4Q"}],"Dividend":[{"name":"Latest Dividend","value":"Rs. 2.00","desc":"Upto 2021 4Q "},{"name":"Dividend Last Quarter","value":"Rs. 2.00","desc":" 2021 4Q "},{"name":"Last Annual Dividend","value":"Rs. 0.00","desc":"Upto 0"},{"name":"Dividend Yield","value":"0.00 %","desc":"Upto 0"},{"name":"Expected Dividend","value":"Rs. 0.00","desc":"Upto 0"},{"name":"Expected Dividend Yield","value":"0.00 %","desc":"Upto 0"},{"name":"Expected Dividend Growth","value":"0.00 %","desc":"Upto 0"},{"name":"Dividend Cover","value":"0.00 x","desc":"Upto 0"},{"name":"Payout Ratio","value":"0.00 %","desc":"Upto 0"},{"name":"Expected Payout Ratio","value":"0.00 %","desc":"Upto 0"}],"Sales":[{"name":"Sales Per Share","value":"Rs. 57.48","desc":"Upto 2024 4Q"},{"name":"Exp Sales Per Share","value":"Rs. 59.62","desc":"Upto 2025 1Q "},{"name":"Price To Sales","value":"1.85 x","desc":"Upto 2024 4Q"},{"name":"Exp Price To Sales","value":"1.78 x","desc":"Upto 2025 1Q "},{"name":"Sales Per Share Growth","value":"13.97 %","desc":"Upto 2024 4Q"},{"name":"Exp Sales PS Growth","value":"3.73 %","desc":"Upto 2025 1Q "}],"Enterprise_Value":[{"name":"EV To Sales","value":"58023089745.00 x","desc":"Upto 2024 4Q "},{"name":"Exp EV To Sales","value":"1.97 x","desc":"Upto 2024 4Q "},{"name":"Enterprise Value","value":"Rs. 58023089745.00","desc":"Upto 2025 1Q  bn"},{"name":"EV To EBITDA","value":"10.85 x","desc":"Upto 2024 4Q "},{"name":"EV Per Share","value":"Rs. 113.44","desc":"Upto 2025 1Q "}],"Cash":[{"name":"Cash Flow Per Share","value":"Rs. -17.43","desc":"Upto 2024 4Q "},{"name":"Cash Per Share","value":"Rs. 0.59","desc":"Upto 2024 4Q "}],"Profitablility":[{"name":"Net Profit Margin","value":"-8.08 %","desc":"Upto 2024 4Q"},{"name":"Gross Profit Margin","value":"46.62 %","desc":"Upto 2024 4Q"},{"name":"EBIT Margin","value":"15.09 %","desc":"Upto 2024 4Q"},{"name":"EBITDA Margin","value":"18.19 %","desc":"Upto 2024 4Q"},{"name":"Net Interest Margin","value":"221.87 %","desc":"Upto 2024 4Q"}],"Liquidity":[{"name":"Interest Cover","value":"1.33 %","desc":"Upto 2024 4Q"},{"name":"Times Interest Earned","value":"0.00 %","desc":"Upto 0"},{"name":"Inventory Turnover","value":"8.52 %","desc":"Upto 2024 4Q"},{"name":"Asset Turnover","value":"46.26 %","desc":"Upto 2024 4Q"},{"name":"Current Ratio","value":"1.60 x","desc":"Upto 2024 4Q "},{"name":"Effective Tax Rate","value":"0.00 %","desc":"Upto 0"},{"name":"Quick Ratio","value":"1.46 x","desc":"Upto 2024 4Q"},{"name":"Net Interest To Assets","value":"21.56 %","desc":"Upto 2024 4Q"}],"Solvency":[{"name":"Long Debt To Equity","value":"11.32 %","desc":"Upto 2024 4Q "},{"name":"Total Debt To Equity","value":"38.45 %","desc":"Upto 2024 4Q "},{"name":"Long Debt To Assets","value":"6.13 %","desc":"Upto 2024 4Q "},{"name":"Total Debt To Assets","value":"20.84 %","desc":"Upto 2024 4Q "}],"Advances_And_Deposits":null,"Insurance":null,"Net_Asset_Value_NAV":null}

class Detail {
  Detail({
      String? symbol, 
      SnapShot? snapShot,}){
    _symbol = symbol;
    _snapShot = snapShot;
}

  Detail.fromJson(dynamic json) {
    _symbol = json['symbol'];
    _snapShot = json['SnapShot'] != null ? SnapShot.fromJson(json['SnapShot']) : null;
  }
  String? _symbol;
  SnapShot? _snapShot;

  String? get symbol => _symbol;
  SnapShot? get snapShot => _snapShot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['symbol'] = _symbol;
    if (_snapShot != null) {
      map['SnapShot'] = _snapShot?.toJson();
    }
    return map;
  }

}