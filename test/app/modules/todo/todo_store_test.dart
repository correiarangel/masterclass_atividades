import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/todo/datasources/remote_todo_datasource.dart';
import 'package:masterclass_atividades/app/modules/todo/models/todo_model.dart';
import 'package:masterclass_atividades/app/modules/todo/repository/todo_repository.dart';
import 'package:masterclass_atividades/app/modules/todo/todo_store.dart';
import 'package:masterclass_atividades/app/shared/services/todo_service.dart';

class TodoStoreMock extends TodoStore {
  TodoStoreMock(TodoReposytory repository) : super(repository);
}

void main() {
  final store = TodoStoreMock(
    TodoReposytory(
      RemoteTodoDataSource(
        TodoService(
          DioForNative(),
        ),
      ),
    ),
  );

  setUp(() {
    debugPrint("Iniciando Suite tests TodoStoreMock");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests TodoStoreMock");
  });

  test('Deve retornar Lista do tipo TodoModel com 10 posição, '
  'title = Estudar clean architecture e isChecked = false ...', () async {
    var todos = await store.getAllTodos();

    expect(todos, isA<List<TodoModel>>());
    expect(todos.length, 10);
    expect(todos[8].title, 'Estudar clean architecture');
    expect(todos[8].isChecked, false);
  });



  test('Deve retornar Lista do tipo TodoModel com 10 posição, '
  'title = Estudar clean architecture e isChecked = false ...', () async {

        var id = 'abe4c710-9bd1-11ec-ae34-6d0fc1ab51df';
    var valueChecked = true;
    var resMap = await store.editTodo(valueChecked: valueChecked, id: id);

    expect(resMap, isA<Map>());
    expect(resMap['isChecked'], true);
  });
}
