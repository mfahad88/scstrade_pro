import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/todos/Todo.dart';
import 'package:scstrade_pro/models/todos/Todos.dart';
import 'package:scstrade_pro/repositories/todo_repository.dart';
import 'package:scstrade_pro/services/api_client.dart';

class TodoViewModel extends ChangeNotifier{
  final TodoRepository _todoRepository;
  ApiResponse<Todo>? responseTodos=ApiResponse<Todo>(status: Status.loading);

  TodoViewModel(this._todoRepository);

  Future<void> fetchTodos(bool isFirst) async {
    responseTodos=ApiResponse<Todo>(status: Status.loading);
    if(!isFirst){
      notifyListeners();
    }

    responseTodos=await _todoRepository.getTodos();
    notifyListeners();
  }


}