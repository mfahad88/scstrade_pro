/// Symbol : null
/// Market_Cap : "197905020000"
/// Avg_Volume_12M : "9439051.518218"
/// One_Month_High : "172.14"
/// One_Month_Low : "138.61"
/// Six_Month_High : "172.14"
/// Six_Month_Low : "118.82"
/// Twelve_Month_High : "175.10"
/// Twelve_Month_Low : "93.45"
/// One_Month_Return : "16.45"
/// Two_Month_Return : "27.70"
/// Six_Month_Return : "22.10"
/// Twelve_Month_Return : "69.46"
/// Paid_Up_Capital : "11850600.00"
/// Authorized_Capital : "1500000000"
/// Total_No_Shares : "1185060000.000000"
/// Free_Float : "645139260"
/// Free_Float_Per : "54.439300"
/// Beta : "1.50024801016923"
/// Face_Value : "10.00"
/// Year_End : "Dec"
/// Description : "Oil and Gas Development Company Limited (OGDCL), was incorporated on 23 October 1997 under the Companies Ordinance, 1984 (now the Companies Act, 2017). The Company was established to undertake exploration and development of oil and gas resources, including production and sale of oil and gas and related activities formerly carried on by Oil and Gas Development Corporation. "

class Overview {
  Overview({
      String? symbol,
      String? marketCap, 
      String? avgVolume12M, 
      String? oneMonthHigh, 
      String? oneMonthLow, 
      String? sixMonthHigh, 
      String? sixMonthLow, 
      String? twelveMonthHigh, 
      String? twelveMonthLow, 
      String? oneMonthReturn, 
      String? twoMonthReturn, 
      String? sixMonthReturn, 
      String? twelveMonthReturn, 
      String? paidUpCapital, 
      String? authorizedCapital, 
      String? totalNoShares, 
      String? freeFloat, 
      String? freeFloatPer, 
      String? beta, 
      String? faceValue, 
      String? yearEnd, 
      String? description,}){
    _symbol = symbol;
    _marketCap = marketCap;
    _avgVolume12M = avgVolume12M;
    _oneMonthHigh = oneMonthHigh;
    _oneMonthLow = oneMonthLow;
    _sixMonthHigh = sixMonthHigh;
    _sixMonthLow = sixMonthLow;
    _twelveMonthHigh = twelveMonthHigh;
    _twelveMonthLow = twelveMonthLow;
    _oneMonthReturn = oneMonthReturn;
    _twoMonthReturn = twoMonthReturn;
    _sixMonthReturn = sixMonthReturn;
    _twelveMonthReturn = twelveMonthReturn;
    _paidUpCapital = paidUpCapital;
    _authorizedCapital = authorizedCapital;
    _totalNoShares = totalNoShares;
    _freeFloat = freeFloat;
    _freeFloatPer = freeFloatPer;
    _beta = beta;
    _faceValue = faceValue;
    _yearEnd = yearEnd;
    _description = description;
}

  Overview.fromJson(dynamic json) {
    _symbol = json['Symbol'];
    _marketCap = json['Market_Cap'];
    _avgVolume12M = json['Avg_Volume_12M'];
    _oneMonthHigh = json['One_Month_High'];
    _oneMonthLow = json['One_Month_Low'];
    _sixMonthHigh = json['Six_Month_High'];
    _sixMonthLow = json['Six_Month_Low'];
    _twelveMonthHigh = json['Twelve_Month_High'];
    _twelveMonthLow = json['Twelve_Month_Low'];
    _oneMonthReturn = json['One_Month_Return'];
    _twoMonthReturn = json['Two_Month_Return'];
    _sixMonthReturn = json['Six_Month_Return'];
    _twelveMonthReturn = json['Twelve_Month_Return'];
    _paidUpCapital = json['Paid_Up_Capital'];
    _authorizedCapital = json['Authorized_Capital'];
    _totalNoShares = json['Total_No_Shares'];
    _freeFloat = json['Free_Float'];
    _freeFloatPer = json['Free_Float_Per'];
    _beta = json['Beta'];
    _faceValue = json['Face_Value'];
    _yearEnd = json['Year_End'];
    _description = json['Description'];
  }
  String? _symbol;
  String? _marketCap;
  String? _avgVolume12M;
  String? _oneMonthHigh;
  String? _oneMonthLow;
  String? _sixMonthHigh;
  String? _sixMonthLow;
  String? _twelveMonthHigh;
  String? _twelveMonthLow;
  String? _oneMonthReturn;
  String? _twoMonthReturn;
  String? _sixMonthReturn;
  String? _twelveMonthReturn;
  String? _paidUpCapital;
  String? _authorizedCapital;
  String? _totalNoShares;
  String? _freeFloat;
  String? _freeFloatPer;
  String? _beta;
  String? _faceValue;
  String? _yearEnd;
  String? _description;

  String? get symbol => _symbol;
  String? get marketCap => _marketCap;
  String? get avgVolume12M => _avgVolume12M;
  String? get oneMonthHigh => _oneMonthHigh;
  String? get oneMonthLow => _oneMonthLow;
  String? get sixMonthHigh => _sixMonthHigh;
  String? get sixMonthLow => _sixMonthLow;
  String? get twelveMonthHigh => _twelveMonthHigh;
  String? get twelveMonthLow => _twelveMonthLow;
  String? get oneMonthReturn => _oneMonthReturn;
  String? get twoMonthReturn => _twoMonthReturn;
  String? get sixMonthReturn => _sixMonthReturn;
  String? get twelveMonthReturn => _twelveMonthReturn;
  String? get paidUpCapital => _paidUpCapital;
  String? get authorizedCapital => _authorizedCapital;
  String? get totalNoShares => _totalNoShares;
  String? get freeFloat => _freeFloat;
  String? get freeFloatPer => _freeFloatPer;
  String? get beta => _beta;
  String? get faceValue => _faceValue;
  String? get yearEnd => _yearEnd;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Symbol'] = _symbol;
    map['Market_Cap'] = _marketCap;
    map['Avg_Volume_12M'] = _avgVolume12M;
    map['One_Month_High'] = _oneMonthHigh;
    map['One_Month_Low'] = _oneMonthLow;
    map['Six_Month_High'] = _sixMonthHigh;
    map['Six_Month_Low'] = _sixMonthLow;
    map['Twelve_Month_High'] = _twelveMonthHigh;
    map['Twelve_Month_Low'] = _twelveMonthLow;
    map['One_Month_Return'] = _oneMonthReturn;
    map['Two_Month_Return'] = _twoMonthReturn;
    map['Six_Month_Return'] = _sixMonthReturn;
    map['Twelve_Month_Return'] = _twelveMonthReturn;
    map['Paid_Up_Capital'] = _paidUpCapital;
    map['Authorized_Capital'] = _authorizedCapital;
    map['Total_No_Shares'] = _totalNoShares;
    map['Free_Float'] = _freeFloat;
    map['Free_Float_Per'] = _freeFloatPer;
    map['Beta'] = _beta;
    map['Face_Value'] = _faceValue;
    map['Year_End'] = _yearEnd;
    map['Description'] = _description;
    return map;
  }

  @override
  String toString() {
    return 'Overview{_symbol: $_symbol, _marketCap: $_marketCap, _avgVolume12M: $_avgVolume12M, _oneMonthHigh: $_oneMonthHigh, _oneMonthLow: $_oneMonthLow, _sixMonthHigh: $_sixMonthHigh, _sixMonthLow: $_sixMonthLow, _twelveMonthHigh: $_twelveMonthHigh, _twelveMonthLow: $_twelveMonthLow, _oneMonthReturn: $_oneMonthReturn, _twoMonthReturn: $_twoMonthReturn, _sixMonthReturn: $_sixMonthReturn, _twelveMonthReturn: $_twelveMonthReturn, _paidUpCapital: $_paidUpCapital, _authorizedCapital: $_authorizedCapital, _totalNoShares: $_totalNoShares, _freeFloat: $_freeFloat, _freeFloatPer: $_freeFloatPer, _beta: $_beta, _faceValue: $_faceValue, _yearEnd: $_yearEnd, _description: $_description}';
  }
}