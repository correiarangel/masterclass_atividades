import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:masterclass_atividades/app/modules/todo/repository/todo_repository.dart';
import 'package:masterclass_atividades/app/shared/services/todo_service.dart';

import 'datasources/remote_todo_datasource.dart';
import 'todo_page.dart';
import 'todo_store.dart';

class TodoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => Dio(
        BaseOptions(
          receiveTimeout: 5000,
          connectTimeout: 5000,
        ),
      ),
    ),
    Bind((i) => TodoService(i.get())),
    Bind((i) => RemoteTodoDataSource((i.get()))),
    Bind((i) => TodoReposytory(i.get())),
    Bind((i) => TodoStore(i.get())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/todoPage', child: (_, args) => const TodoPage()),
  ];
}
