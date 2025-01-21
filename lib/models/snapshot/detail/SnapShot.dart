import 'Insurance.dart';
import 'AdvanceAndDeposits.dart';
import 'NetAssetValueNav.dart';

import 'Earnings.dart';
import 'Equity.dart';
import 'Dividend.dart';
import 'Sales.dart';
import 'EnterpriseValue.dart';
import 'Cash.dart';
import 'Profitablility.dart';
import 'Liquidity.dart';
import 'Solvency.dart';

/// Earnings : [{"name":"Latest EPS","value":"Rs. 0.80","desc":"Upto 2025 1Q "},{"name":"Last Annual EPS","value":"Rs. -4.65","desc":"Upto 2024 4Q"},{"name":"Price To Earning PE","value":"0.00 x","desc":"Upto 0"},{"name":"Exp Price To Earning PE","value":"33.25 x","desc":"Upto 2025 1Q "},{"name":"Exp Earning Gowth","value":"168.82 %","desc":"Upto 2025 1Q "},{"name":"Price Earning Growth","value":"0.20 x","desc":"Upto 2025 1Q "}]
/// Equity : [{"name":"Book Value","value":"Rs. 67.34","desc":"Upto 2024 4Q "},{"name":"Exp Book Value","value":"Rs. 70.54","desc":"Upto 2024 4Q "},{"name":"Book Value Growth","value":"8.74 %","desc":"Upto 2024 4Q"},{"name":"Exp Book Value Growth","value":"4.75 %","desc":"Upto 2024 4Q "},{"name":"Price To Book Value","value":"1.58 x","desc":"Upto 2024 4Q "},{"name":"Exp Price To Book Value","value":"1.51 x","desc":"Upto 2024 4Q "},{"name":"Return On Equity","value":"-6.90 %","desc":"Upto 2024 4Q"},{"name":"Exp Return On Equity","value":"4.54 %","desc":"Upto 2024 4Q "},{"name":"Retention Ratio","value":"0.00 %","desc":"Upto 0"},{"name":"Exp Retention Ratio","value":"0.00 %","desc":"Upto 0"},{"name":"Equity To Assets Ratio","value":"54.19 %","desc":"Upto 2024 4Q"},{"name":"Return On Assets","value":"-3.74 %","desc":"Upto 2024 4Q"},{"name":"Return On Cap Employed","value":"11.57 %","desc":"Upto 2024 4Q"}]
/// Dividend : [{"name":"Latest Dividend","value":"Rs. 2.00","desc":"Upto 2021 4Q "},{"name":"Dividend Last Quarter","value":"Rs. 2.00","desc":" 2021 4Q "},{"name":"Last Annual Dividend","value":"Rs. 0.00","desc":"Upto 0"},{"name":"Dividend Yield","value":"0.00 %","desc":"Upto 0"},{"name":"Expected Dividend","value":"Rs. 0.00","desc":"Upto 0"},{"name":"Expected Dividend Yield","value":"0.00 %","desc":"Upto 0"},{"name":"Expected Dividend Growth","value":"0.00 %","desc":"Upto 0"},{"name":"Dividend Cover","value":"0.00 x","desc":"Upto 0"},{"name":"Payout Ratio","value":"0.00 %","desc":"Upto 0"},{"name":"Expected Payout Ratio","value":"0.00 %","desc":"Upto 0"}]
/// Sales : [{"name":"Sales Per Share","value":"Rs. 57.48","desc":"Upto 2024 4Q"},{"name":"Exp Sales Per Share","value":"Rs. 59.62","desc":"Upto 2025 1Q "},{"name":"Price To Sales","value":"1.85 x","desc":"Upto 2024 4Q"},{"name":"Exp Price To Sales","value":"1.78 x","desc":"Upto 2025 1Q "},{"name":"Sales Per Share Growth","value":"13.97 %","desc":"Upto 2024 4Q"},{"name":"Exp Sales PS Growth","value":"3.73 %","desc":"Upto 2025 1Q "}]
/// Enterprise_Value : [{"name":"EV To Sales","value":"58023089745.00 x","desc":"Upto 2024 4Q "},{"name":"Exp EV To Sales","value":"1.97 x","desc":"Upto 2024 4Q "},{"name":"Enterprise Value","value":"Rs. 58023089745.00","desc":"Upto 2025 1Q  bn"},{"name":"EV To EBITDA","value":"10.85 x","desc":"Upto 2024 4Q "},{"name":"EV Per Share","value":"Rs. 113.44","desc":"Upto 2025 1Q "}]
/// Cash : [{"name":"Cash Flow Per Share","value":"Rs. -17.43","desc":"Upto 2024 4Q "},{"name":"Cash Per Share","value":"Rs. 0.59","desc":"Upto 2024 4Q "}]
/// Profitablility : [{"name":"Net Profit Margin","value":"-8.08 %","desc":"Upto 2024 4Q"},{"name":"Gross Profit Margin","value":"46.62 %","desc":"Upto 2024 4Q"},{"name":"EBIT Margin","value":"15.09 %","desc":"Upto 2024 4Q"},{"name":"EBITDA Margin","value":"18.19 %","desc":"Upto 2024 4Q"},{"name":"Net Interest Margin","value":"221.87 %","desc":"Upto 2024 4Q"}]
/// Liquidity : [{"name":"Interest Cover","value":"1.33 %","desc":"Upto 2024 4Q"},{"name":"Times Interest Earned","value":"0.00 %","desc":"Upto 0"},{"name":"Inventory Turnover","value":"8.52 %","desc":"Upto 2024 4Q"},{"name":"Asset Turnover","value":"46.26 %","desc":"Upto 2024 4Q"},{"name":"Current Ratio","value":"1.60 x","desc":"Upto 2024 4Q "},{"name":"Effective Tax Rate","value":"0.00 %","desc":"Upto 0"},{"name":"Quick Ratio","value":"1.46 x","desc":"Upto 2024 4Q"},{"name":"Net Interest To Assets","value":"21.56 %","desc":"Upto 2024 4Q"}]
/// Solvency : [{"name":"Long Debt To Equity","value":"11.32 %","desc":"Upto 2024 4Q "},{"name":"Total Debt To Equity","value":"38.45 %","desc":"Upto 2024 4Q "},{"name":"Long Debt To Assets","value":"6.13 %","desc":"Upto 2024 4Q "},{"name":"Total Debt To Assets","value":"20.84 %","desc":"Upto 2024 4Q "}]
/// Advances_And_Deposits : null
/// Insurance : null
/// Net_Asset_Value_NAV : null

class SnapShot {
  SnapShot({
      List<Earnings>? earnings, 
      List<Equity>? equity, 
      List<Dividend>? dividend, 
      List<Sales>? sales, 
      List<EnterpriseValue>? enterpriseValue, 
      List<Cash>? cash, 
      List<Profitablility>? profitablility, 
      List<Liquidity>? liquidity, 
      List<Solvency>? solvency,
    List<AdvanceAndDeposits>? advancesAndDeposits,
    List<Insurance>? insurance,
    List<NetAssetValueNav>? netAssetValueNAV,}){
    _earnings = earnings;
    _equity = equity;
    _dividend = dividend;
    _sales = sales;
    _enterpriseValue = enterpriseValue;
    _cash = cash;
    _profitablility = profitablility;
    _liquidity = liquidity;
    _solvency = solvency;
    _advancesAndDeposits = advancesAndDeposits;
    _insurance = insurance;
    _netAssetValueNAV = netAssetValueNAV;
}

  SnapShot.fromJson(dynamic json) {
    if (json['Earnings'] != null) {
      _earnings = [];
      json['Earnings'].forEach((v) {
        _earnings?.add(Earnings.fromJson(v));
      });
    }
    if (json['Equity'] != null) {
      _equity = [];
      json['Equity'].forEach((v) {
        _equity?.add(Equity.fromJson(v));
      });
    }
    if (json['Dividend'] != null) {
      _dividend = [];
      json['Dividend'].forEach((v) {
        _dividend?.add(Dividend.fromJson(v));
      });
    }
    if (json['Sales'] != null) {
      _sales = [];
      json['Sales'].forEach((v) {
        _sales?.add(Sales.fromJson(v));
      });
    }
    if (json['Enterprise_Value'] != null) {
      _enterpriseValue = [];
      json['Enterprise_Value'].forEach((v) {
        _enterpriseValue?.add(EnterpriseValue.fromJson(v));
      });
    }
    if (json['Cash'] != null) {
      _cash = [];
      json['Cash'].forEach((v) {
        _cash?.add(Cash.fromJson(v));
      });
    }
    if (json['Profitablility'] != null) {
      _profitablility = [];
      json['Profitablility'].forEach((v) {
        _profitablility?.add(Profitablility.fromJson(v));
      });
    }
    if (json['Liquidity'] != null) {
      _liquidity = [];
      json['Liquidity'].forEach((v) {
        _liquidity?.add(Liquidity.fromJson(v));
      });
    }
    if (json['Solvency'] != null) {
      _solvency = [];
      json['Solvency'].forEach((v) {
        _solvency?.add(Solvency.fromJson(v));
      });
    }
    _advancesAndDeposits = json['Advances_And_Deposits'];
    _insurance = json['Insurance'];
    _netAssetValueNAV = json['Net_Asset_Value_NAV'];
  }
  List<Earnings>? _earnings;
  List<Equity>? _equity;
  List<Dividend>? _dividend;
  List<Sales>? _sales;
  List<EnterpriseValue>? _enterpriseValue;
  List<Cash>? _cash;
  List<Profitablility>? _profitablility;
  List<Liquidity>? _liquidity;
  List<Solvency>? _solvency;
  List<AdvanceAndDeposits>? _advancesAndDeposits;
  List<Insurance>? _insurance;
  List<NetAssetValueNav>? _netAssetValueNAV;

  List<Earnings>? get earnings => _earnings;
  List<Equity>? get equity => _equity;
  List<Dividend>? get dividend => _dividend;
  List<Sales>? get sales => _sales;
  List<EnterpriseValue>? get enterpriseValue => _enterpriseValue;
  List<Cash>? get cash => _cash;
  List<Profitablility>? get profitablility => _profitablility;
  List<Liquidity>? get liquidity => _liquidity;
  List<Solvency>? get solvency => _solvency;
  List<AdvanceAndDeposits>?  get advancesAndDeposits => _advancesAndDeposits;
  List<Insurance>?  get insurance => _insurance;
  List<NetAssetValueNav>? get netAssetValueNAV => _netAssetValueNAV;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_earnings != null) {
      map['Earnings'] = _earnings?.map((v) => v.toJson()).toList();
    }
    if (_equity != null) {
      map['Equity'] = _equity?.map((v) => v.toJson()).toList();
    }
    if (_dividend != null) {
      map['Dividend'] = _dividend?.map((v) => v.toJson()).toList();
    }
    if (_sales != null) {
      map['Sales'] = _sales?.map((v) => v.toJson()).toList();
    }
    if (_enterpriseValue != null) {
      map['Enterprise_Value'] = _enterpriseValue?.map((v) => v.toJson()).toList();
    }
    if (_cash != null) {
      map['Cash'] = _cash?.map((v) => v.toJson()).toList();
    }
    if (_profitablility != null) {
      map['Profitablility'] = _profitablility?.map((v) => v.toJson()).toList();
    }
    if (_liquidity != null) {
      map['Liquidity'] = _liquidity?.map((v) => v.toJson()).toList();
    }
    if (_solvency != null) {
      map['Solvency'] = _solvency?.map((v) => v.toJson()).toList();
    }
    map['Advances_And_Deposits'] = _advancesAndDeposits;
    map['Insurance'] = _insurance;
    map['Net_Asset_Value_NAV'] = _netAssetValueNAV;
    return map;
  }

}