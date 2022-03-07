import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';

import 'models/todo_model.dart';
import 'repository/todo_repository.dart';

class TodoStore extends ChangeNotifier {
  final TodoReposytory repository;
  List<TodoModel> todos = [];
  Map mapEdit = {};

  TodoStore(this.repository);

  Future<List<TodoModel>> getAllTodos() async {
    todos = await repository.getTodos();
    notifyListeners();
    return todos;
  }

  Future<Map> editTodo({required valueChecked, required String id}) async {

    final param = {"isChecked": !valueChecked};
    final Map map = await repository.editToto(
        id: id, url: ConstStringUrl.todosAllUrl, param: param)!;
    notifyListeners();
    await getAllTodos();
    return map;
  }
}
