
import 'package:flutter_modular/flutter_modular.dart';
import 'repository/todo_repository.dart';


import 'datasources/remote_todo_datasource.dart';
import 'todo_page.dart';
import 'todo_store.dart';

class TodoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RemoteTodoDataSource((i.get()))),
    Bind((i) => TodoReposytory(i.get())),
    Bind((i) => TodoStore(i.get())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/todoPage', child: (_, args) => const TodoPage()),
  ];
}
