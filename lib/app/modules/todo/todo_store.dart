import 'package:flutter/material.dart';

import 'models/todo_model.dart';
import 'repository/todo_repository.dart';

class TodoStore extends ChangeNotifier {
  final TodoReposytory repository;
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => List<TodoModel>.unmodifiable(_todos);
  // ignore: prefer_final_fields
  Map _mapEdit = {};
  Map get mapEdit => Map.unmodifiable(_mapEdit);
  String _title = '';
  String get title => _title;

  TodoStore(this.repository);

  Future<List<TodoModel>> getAllTodos() async {
    _todos = await repository.getTodos() ?? <TodoModel>[];
    notifyListeners();
    return _todos;
  }

  Future<Map> editTodo({required valueChecked, required String id}) async {
    final param = {"isChecked": !valueChecked};
    final Map map = await repository.editToto(id: id, param: param) ?? {};
    notifyListeners();
    await getAllTodos();
    return map;
  }

  Future<Map> addTodo({
    required valueChecked,
    required String title,
  }) async {
    final param = {"isChecked": false, "title": title};
    final Map map = await repository.addToto(param: param) ?? {};
    notifyListeners();
    await getAllTodos();
    return map;
  }

  Future<Map> excluirTodo({
    required String id,
  }) async {
    final Map map = await repository.excluirToto(id: id) ?? {};
    notifyListeners();
    await getAllTodos();
    return map;
  }

  String? validateText() {
    if (_title.isEmpty) {
      return 'Digite Um lembrete';
    } else if (_title.length < 5) {
      return "Muito curto para um lenbrete";
    } else {
      return null;
    }
  }

  String changesTitle(String value) {
    _title = value;
    notifyListeners();
    return _title;
  }
}
