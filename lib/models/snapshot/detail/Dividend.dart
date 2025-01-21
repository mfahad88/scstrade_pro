/// name : "Latest Dividend"
/// value : "Rs. 2.00"
/// desc : "Upto 2021 4Q "

class Dividend {
  Dividend({
      String? name, 
      String? value, 
      String? desc,}){
    _name = name;
    _value = value;
    _desc = desc;
}

  Dividend.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
    _desc = json['desc'];
  }
  String? _name;
  String? _value;
  String? _desc;

  String? get name => _name;
  String? get value => _value;
  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    map['desc'] = _desc;
    return map;
  }

}