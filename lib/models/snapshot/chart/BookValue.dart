/// Year : ["2023","2022","2021","2020","2019","2018","2017","2016"]
/// Book_Value_PKR : [152.99,138.92,149.76,147.51,130.7,130.36,117.44,96.62]
/// Price_To_Book_Value_X : [0.78,1.23,2.12,2.48,2.65,5.11,6.04,5.35]

class BookValue {
  BookValue({
      List<String>? year, 
      List<num>? bookValuePKR, 
      List<num>? priceToBookValueX,}){
    _year = year;
    _bookValuePKR = bookValuePKR;
    _priceToBookValueX = priceToBookValueX;
}

  BookValue.fromJson(dynamic json) {
    _year = json['Year'] != null ? json['Year'].cast<String>() : [];
    _bookValuePKR = json['Book_Value_PKR'] != null ? json['Book_Value_PKR'].cast<num>() : [];
    _priceToBookValueX = json['Price_To_Book_Value_X'] != null ? json['Price_To_Book_Value_X'].cast<num>() : [];
  }
  List<String>? _year;
  List<num>? _bookValuePKR;
  List<num>? _priceToBookValueX;

  List<String>? get year => _year;
  List<num>? get bookValuePKR => _bookValuePKR;
  List<num>? get priceToBookValueX => _priceToBookValueX;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Year'] = _year;
    map['Book_Value_PKR'] = _bookValuePKR;
    map['Price_To_Book_Value_X'] = _priceToBookValueX;
    return map;
  }

}