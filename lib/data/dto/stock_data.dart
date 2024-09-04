/// SYM : "786"
/// NM : "786 Investments Limited"
/// company_logo : "https://www.scstrade.com/img/appicon/ogdc.jpg"
/// CL : 6.13
/// V : 10
/// CH : 0.38
/// CHP : 5.83717357910906
/// BP : 5.71
/// BV : 1
/// AP : 6.12
/// AV : 2
/// HP : 6.13
/// LP : 6.13
/// AvgP : 6.13
/// SN : "INV. BANKS / INV. COS. / SECURITIES COS."
/// OC : 5.75
/// IN : ""

class StockData {
  StockData({
      String? sym, 
      String? nm, 
      String? companyLogo, 
      num? cl, 
      num? v, 
      num? ch, 
      num? chp, 
      num? bp, 
      num? bv, 
      num? ap, 
      num? av, 
      num? hp, 
      num? lp, 
      num? avgP, 
      String? sn, 
      num? oc, 
      String? ind,}){
    _sym = sym;
    _nm = nm;
    _companyLogo = companyLogo;
    _cl = cl;
    _v = v;
    _ch = ch;
    _chp = chp;
    _bp = bp;
    _bv = bv;
    _ap = ap;
    _av = av;
    _hp = hp;
    _lp = lp;
    _avgP = avgP;
    _sn = sn;
    _oc = oc;
    _ind = ind;
}

  StockData.fromJson(dynamic json) {
    _sym = json['SYM'];
    _nm = json['NM'];
    _companyLogo = json['company_logo'];
    _cl = json['CL'];
    _v = json['V'];
    _ch = json['CH'];
    _chp = json['CHP'];
    _bp = json['BP'];
    _bv = json['BV'];
    _ap = json['AP'];
    _av = json['AV'];
    _hp = json['HP'];
    _lp = json['LP'];
    _avgP = json['AvgP'];
    _sn = json['SN'];
    _oc = json['OC'];
    _ind = json['IN'];
  }
  String? _sym;
  String? _nm;
  String? _companyLogo;
  num? _cl;
  num? _v;
  num? _ch;
  num? _chp;
  num? _bp;
  num? _bv;
  num? _ap;
  num? _av;
  num? _hp;
  num? _lp;
  num? _avgP;
  String? _sn;
  num? _oc;
  String? _ind;

  String? get sym => _sym;
  String? get nm => _nm;
  String? get companyLogo => _companyLogo;
  num? get cl => _cl;
  num? get v => _v;
  num? get ch => _ch;
  num? get chp => _chp;
  num? get bp => _bp;
  num? get bv => _bv;
  num? get ap => _ap;
  num? get av => _av;
  num? get hp => _hp;
  num? get lp => _lp;
  num? get avgP => _avgP;
  String? get sn => _sn;
  num? get oc => _oc;
  String? get ind => _ind;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SYM'] = _sym;
    map['NM'] = _nm;
    map['company_logo'] = _companyLogo;
    map['CL'] = _cl;
    map['V'] = _v;
    map['CH'] = _ch;
    map['CHP'] = _chp;
    map['BP'] = _bp;
    map['BV'] = _bv;
    map['AP'] = _ap;
    map['AV'] = _av;
    map['HP'] = _hp;
    map['LP'] = _lp;
    map['AvgP'] = _avgP;
    map['SN'] = _sn;
    map['OC'] = _oc;
    map['IN'] = _ind;
    return map;
  }

}