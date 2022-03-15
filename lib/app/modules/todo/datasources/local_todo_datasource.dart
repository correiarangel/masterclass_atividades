import 'dart:convert';

import '../../../shared/util/value/const_string_todos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalTodoDataSource {
  
  Future<List> getTodos() async {
    final shared = await SharedPreferences.getInstance();
    final jsonString = shared.getString(ConstStringTodos.keyTodos);
    return jsonDecode(jsonString ?? '[]');
  }

  Future<String> saveTodos() async {
    final shared = await SharedPreferences.getInstance();
    shared.setString(ConstStringTodos.keyTodos, jsonEncode(json));
    return 'save_finished';
  }
}
