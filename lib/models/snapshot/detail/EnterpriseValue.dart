/// name : "EV To Sales"
/// value : "58023089745.00 x"
/// desc : "Upto 2024 4Q "

class EnterpriseValue {
  EnterpriseValue({
      String? name, 
      String? value, 
      String? desc,}){
    _name = name;
    _value = value;
    _desc = desc;
}

  EnterpriseValue.fromJson(dynamic json) {
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