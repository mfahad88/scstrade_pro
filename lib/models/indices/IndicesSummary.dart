/// INDEX_CODE : "KSE All Share Index"
/// CURRENT_INDEX : "73492.98"
/// VOLUME_TRADED : "1418605632"
/// VALUE_TRADED : "64008020267.09"
/// HIGH_INDEX : "73847.40"
/// LOW_INDEX : "73054.74"
/// NET_CHANGE : "1130.76"
/// PreClose : 72362.22
/// MarketStatus : "OPEN"

class IndicesSummary {
  IndicesSummary({
      String? indexcode, 
      String? currentindex, 
      String? volumetraded, 
      String? valuetraded, 
      String? highindex, 
      String? lowindex, 
      String? netchange, 
      num? preClose, 
      String? marketStatus,}){
    _indexcode = indexcode;
    _currentindex = currentindex;
    _volumetraded = volumetraded;
    _valuetraded = valuetraded;
    _highindex = highindex;
    _lowindex = lowindex;
    _netchange = netchange;
    _preClose = preClose;
    _marketStatus = marketStatus;
}

  IndicesSummary.fromJson(dynamic json) {
    _indexcode = json['INDEX_CODE'];
    _currentindex = json['CURRENT_INDEX'];
    _volumetraded = json['VOLUME_TRADED'];
    _valuetraded = json['VALUE_TRADED'];
    _highindex = json['HIGH_INDEX'];
    _lowindex = json['LOW_INDEX'];
    _netchange = json['NET_CHANGE'];
    _preClose = json['PreClose'];
    _marketStatus = json['MarketStatus'];
  }
  String? _indexcode;
  String? _currentindex;
  String? _volumetraded;
  String? _valuetraded;
  String? _highindex;
  String? _lowindex;
  String? _netchange;
  num? _preClose;
  String? _marketStatus;

  String? get indexcode => _indexcode;
  String? get currentindex => _currentindex;
  String? get volumetraded => _volumetraded;
  String? get valuetraded => _valuetraded;
  String? get highindex => _highindex;
  String? get lowindex => _lowindex;
  String? get netchange => _netchange;
  num? get preClose => _preClose;
  String? get marketStatus => _marketStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INDEX_CODE'] = _indexcode;
    map['CURRENT_INDEX'] = _currentindex;
    map['VOLUME_TRADED'] = _volumetraded;
    map['VALUE_TRADED'] = _valuetraded;
    map['HIGH_INDEX'] = _highindex;
    map['LOW_INDEX'] = _lowindex;
    map['NET_CHANGE'] = _netchange;
    map['PreClose'] = _preClose;
    map['MarketStatus'] = _marketStatus;
    return map;
  }

}