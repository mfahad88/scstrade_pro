/// company_code : "POL"
/// company_name : "Pakistan Oilfields Ltd.                 "
/// bm_date : "/Date(1731870000000)/"
/// bm_time : "2.30 P.M"
/// bm_place : "Rawalpindi"
/// bm_year : "June"
/// bm_quarter_number : "1Q25"
/// bm_eps_quarter : ""
/// bm_eps_cum : ""
/// bm_dividend : ""
/// bm_bonus : ""
/// bm_right_per : ""
/// bm_bc_ld : ""
/// bm_bc_startd : ""
/// bm_bc_endd : ""
/// bm_bc_exp : "/Date(-2209006800000)/"

class Meetings {
  Meetings({
      String? companyCode, 
      String? companyName, 
      String? bmDate, 
      String? bmTime, 
      String? bmPlace, 
      String? bmYear, 
      String? bmQuarterNumber, 
      String? bmEpsQuarter, 
      String? bmEpsCum, 
      String? bmDividend, 
      String? bmBonus, 
      String? bmRightPer, 
      String? bmBcLd, 
      String? bmBcStartd, 
      String? bmBcEndd, 
      String? bmBcExp,}){
    _companyCode = companyCode;
    _companyName = companyName;
    _bmDate = bmDate;
    _bmTime = bmTime;
    _bmPlace = bmPlace;
    _bmYear = bmYear;
    _bmQuarterNumber = bmQuarterNumber;
    _bmEpsQuarter = bmEpsQuarter;
    _bmEpsCum = bmEpsCum;
    _bmDividend = bmDividend;
    _bmBonus = bmBonus;
    _bmRightPer = bmRightPer;
    _bmBcLd = bmBcLd;
    _bmBcStartd = bmBcStartd;
    _bmBcEndd = bmBcEndd;
    _bmBcExp = bmBcExp;
}

  Meetings.fromJson(dynamic json) {

    _companyCode = json['company_code'] as String?;
    _companyName = json['company_name'];
    _bmDate = json['bm_date'];
    _bmTime = json['bm_time'];
    _bmPlace = json['bm_place'];
    _bmYear = json['bm_year'];
    _bmQuarterNumber = json['bm_quarter_number'];
    _bmEpsQuarter = json['bm_eps_quarter'];
    _bmEpsCum = json['bm_eps_cum'];
    _bmDividend = json['bm_dividend'];
    _bmBonus = json['bm_bonus'];
    _bmRightPer = json['bm_right_per'];
    _bmBcLd = json['bm_bc_ld'];
    _bmBcStartd = json['bm_bc_startd'];
    _bmBcEndd = json['bm_bc_endd'];
    _bmBcExp = json['bm_bc_exp'];
  }
  String? _companyCode;
  String? _companyName;
  String? _bmDate;
  String? _bmTime;
  String? _bmPlace;
  String? _bmYear;
  String? _bmQuarterNumber;
  String? _bmEpsQuarter;
  String? _bmEpsCum;
  String? _bmDividend;
  String? _bmBonus;
  String? _bmRightPer;
  String? _bmBcLd;
  String? _bmBcStartd;
  String? _bmBcEndd;
  String? _bmBcExp;

  String? get companyCode => _companyCode;
  String? get companyName => _companyName;
  String? get bmDate => _bmDate;
  String? get bmTime => _bmTime;
  String? get bmPlace => _bmPlace;
  String? get bmYear => _bmYear;
  String? get bmQuarterNumber => _bmQuarterNumber;
  String? get bmEpsQuarter => _bmEpsQuarter;
  String? get bmEpsCum => _bmEpsCum;
  String? get bmDividend => _bmDividend;
  String? get bmBonus => _bmBonus;
  String? get bmRightPer => _bmRightPer;
  String? get bmBcLd => _bmBcLd;
  String? get bmBcStartd => _bmBcStartd;
  String? get bmBcEndd => _bmBcEndd;
  String? get bmBcExp => _bmBcExp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_code'] = _companyCode;
    map['company_name'] = _companyName;
    map['bm_date'] = _bmDate;
    map['bm_time'] = _bmTime;
    map['bm_place'] = _bmPlace;
    map['bm_year'] = _bmYear;
    map['bm_quarter_number'] = _bmQuarterNumber;
    map['bm_eps_quarter'] = _bmEpsQuarter;
    map['bm_eps_cum'] = _bmEpsCum;
    map['bm_dividend'] = _bmDividend;
    map['bm_bonus'] = _bmBonus;
    map['bm_right_per'] = _bmRightPer;
    map['bm_bc_ld'] = _bmBcLd;
    map['bm_bc_startd'] = _bmBcStartd;
    map['bm_bc_endd'] = _bmBcEndd;
    map['bm_bc_exp'] = _bmBcExp;
    return map;
  }

}