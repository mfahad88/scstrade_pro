/// INDEX_CODE : "KSE All Share Index"
/// CURRENT_INDEX : "67804.96"
/// VOLUME_TRADED : "339658660"
/// VALUE_TRADED : "16921171362.28"
/// HIGH_INDEX : "68143.05"
/// LOW_INDEX : "66997.98"
/// NET_CHANGE : "320.70"
/// PreClose : 67484.26
/// MarketStatus : "OPEN"

class KseIndices {
  KseIndices({
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

  KseIndices.fromJson(dynamic json) {
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