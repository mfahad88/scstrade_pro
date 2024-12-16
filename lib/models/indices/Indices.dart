/// Type : "Volume Leaders"
/// Symbol : "PRL"
/// Name : "Pakistan Refinery Ltd.                  "
/// ClosePrice : 36.32
/// Volume : 53378641
/// Change : 2.52
/// ChangePercentage : 6.488156539649845
/// bid_price : 36.31
/// bid_vol : 17600
/// Ask_price : 36.32
/// Ask_vol : 36706
/// LastTradeTime : "15:21:59"
/// HIGH_PRICE : 36.8
/// LOW_PRICE : 33.86
/// AVG_PRICE : 35.823632195132134

class Indices {
  Indices({
      String? type, 
      String? symbol, 
      String? name, 
      num? closePrice, 
      num? volume, 
      num? change, 
      num? changePercentage, 
      num? bidPrice, 
      num? bidVol, 
      num? askPrice, 
      num? askVol, 
      String? lastTradeTime, 
      num? highprice, 
      num? lowprice, 
      num? avgprice,}){
    _type = type;
    _symbol = symbol;
    _name = name;
    _closePrice = closePrice;
    _volume = volume;
    _change = change;
    _changePercentage = changePercentage;
    _bidPrice = bidPrice;
    _bidVol = bidVol;
    _askPrice = askPrice;
    _askVol = askVol;
    _lastTradeTime = lastTradeTime;
    _highprice = highprice;
    _lowprice = lowprice;
    _avgprice = avgprice;
}

  Indices.fromJson(dynamic json) {
    _type = json['Type'];
    _symbol = json['Symbol'];
    _name = json['Name'];
    _closePrice = json['ClosePrice'];
    _volume = json['Volume'];
    _change = json['Change'];
    _changePercentage = json['ChangePercentage'];
    _bidPrice = json['bid_price'];
    _bidVol = json['bid_vol'];
    _askPrice = json['Ask_price'];
    _askVol = json['Ask_vol'];
    _lastTradeTime = json['LastTradeTime'];
    _highprice = json['HIGH_PRICE'];
    _lowprice = json['LOW_PRICE'];
    _avgprice = json['AVG_PRICE'];
  }
  String? _type;
  String? _symbol;
  String? _name;
  num? _closePrice;
  num? _volume;
  num? _change;
  num? _changePercentage;
  num? _bidPrice;
  num? _bidVol;
  num? _askPrice;
  num? _askVol;
  String? _lastTradeTime;
  num? _highprice;
  num? _lowprice;
  num? _avgprice;

  String? get type => _type;
  String? get symbol => _symbol;
  String? get name => _name;
  num? get closePrice => _closePrice;
  num? get volume => _volume;
  num? get change => _change;
  num? get changePercentage => _changePercentage;
  num? get bidPrice => _bidPrice;
  num? get bidVol => _bidVol;
  num? get askPrice => _askPrice;
  num? get askVol => _askVol;
  String? get lastTradeTime => _lastTradeTime;
  num? get highprice => _highprice;
  num? get lowprice => _lowprice;
  num? get avgprice => _avgprice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Type'] = _type;
    map['Symbol'] = _symbol;
    map['Name'] = _name;
    map['ClosePrice'] = _closePrice;
    map['Volume'] = _volume;
    map['Change'] = _change;
    map['ChangePercentage'] = _changePercentage;
    map['bid_price'] = _bidPrice;
    map['bid_vol'] = _bidVol;
    map['Ask_price'] = _askPrice;
    map['Ask_vol'] = _askVol;
    map['LastTradeTime'] = _lastTradeTime;
    map['HIGH_PRICE'] = _highprice;
    map['LOW_PRICE'] = _lowprice;
    map['AVG_PRICE'] = _avgprice;
    return map;
  }

}