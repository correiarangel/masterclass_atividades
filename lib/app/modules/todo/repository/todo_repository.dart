import 'package:dio/dio.dart';
import '../../../shared/util/value/const_srtring_url.dart';

import '../datasources/remote_todo_datasource.dart';
import '../models/todo_model.dart';

class TodoReposytory {
  final RemoteTodoDataSource remoteTodoDataSource;

  TodoReposytory(this.remoteTodoDataSource);

  Future<List<TodoModel>>? getTodos() async {
    final Response? response = await remoteTodoDataSource.getTodos(
      url: ConstStringUrl.todosAllUrl,
    );
    if (response != null && response.statusCode == 200) {
      var list = response.data as List;

      List<TodoModel> todos = list
          .map(
            (td) => TodoModel.fromMap(td),
          )
          .toList();
      return todos;
    } else {
      return [];
    }
  }

  Future<Map>? editToto({
    required String id,
    required Map<String, dynamic> param,
  }) async {
    final Response? response = await remoteTodoDataSource.editar(
      url:  ConstStringUrl.todosAllUrl,
      id: id,
      param: param,
    );
    if (response != null && response.statusCode == 200) {
      return response.data;
    } else {
      return {};
    }
  }

  Future<Map>? addToto({
    required Map<String, dynamic> param,
  }) async {
    final Response? response = await remoteTodoDataSource.addTodo(
      url: ConstStringUrl.todosAllUrl,
      param: param,
    );
    if (response != null && response.statusCode == 200) {
      return response.data;
    } else {
      return {};
    }
  }

    Future<Map>? excluirToto({
    required String id,
  }) async {
    final Response? response = await remoteTodoDataSource.excluir(
      url: ConstStringUrl.todosAllUrl,
      id: id,
    );
    if (response != null && response.statusCode == 200) {
      return response.data;
    } else {
      return {};
    }
  }
}
/*
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:masterclass_atividades/app/modules/todo/datasources/local_todo_datasource.dart';
import 'package:masterclass_atividades/app/shared/util/check_internet.dart';

import '../../../shared/util/value/const_srtring_url.dart';
import '../datasources/remote_todo_datasource.dart';
import '../models/todo_model.dart';

class TodoReposytory {
  final RemoteTodoDataSource remoteTodoDataSource;

  TodoReposytory(this.remoteTodoDataSource);

  Future<List<TodoModel>> getTodos() async {
    var isNet = await checkedNet();

    if (isNet) {
      var list = await recoveryTodosRemote();
      var todos = list.map((td) => TodoModel.fromMap(td)).toList();
      return todos;
    } else {
      var list = await recoveryTodoLocal();
      var todos = list.map((td) => TodoModel.fromMap(td)).toList();
      return todos;
    }
  }

  Future<bool> checkedNet() {
    final CheckInternet checkInternet = Modular.get();
    return checkInternet.isInternet();
  }

  Future<List> recoveryTodoLocal() async {
    final LocalTodoDataSource localTodoDataSource = Modular.get();
    var todos = await localTodoDataSource.getTodos();
    return todos;
  }

  Future<List> recoveryTodosRemote() async {
    final Response response = await remoteTodoDataSource.getTodos(
      url: ConstStringUrl.todosAllUrl,
    );
    if (response.statusCode == 200) {
      var list = response.data as List;
      return list;
    } else {
      return [];
    }
  }
}

 */