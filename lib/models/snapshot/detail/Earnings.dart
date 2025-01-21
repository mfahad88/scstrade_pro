/// name : "Latest EPS"
/// value : "Rs. 0.80"
/// desc : "Upto 2025 1Q "

class Earnings {
  Earnings({
      String? name, 
      String? value, 
      String? desc,}){
    _name = name;
    _value = value;
    _desc = desc;
}

  Earnings.fromJson(dynamic json) {
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