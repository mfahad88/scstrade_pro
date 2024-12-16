/// id : 1
/// todo : "Do something nice for someone you care about"
/// completed : false
/// userId : 152

class Todos {
  Todos({
      num? id, 
      String? todo, 
      bool? completed, 
      num? userId,}){
    _id = id;
    _todo = todo;
    _completed = completed;
    _userId = userId;
}

  Todos.fromJson(dynamic json) {
    _id = json['id'];
    _todo = json['todo'];
    _completed = json['completed'];
    _userId = json['userId'];
  }
  num? _id;
  String? _todo;
  bool? _completed;
  num? _userId;

  num? get id => _id;
  String? get todo => _todo;
  bool? get completed => _completed;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['todo'] = _todo;
    map['completed'] = _completed;
    map['userId'] = _userId;
    return map;
  }

}