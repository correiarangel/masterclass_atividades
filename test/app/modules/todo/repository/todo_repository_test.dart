import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/todo/datasources/remote_todo_datasource.dart';
import 'package:masterclass_atividades/app/modules/todo/models/todo_model.dart';
import 'package:masterclass_atividades/app/modules/todo/repository/todo_repository.dart';
import 'package:masterclass_atividades/app/shared/services/todo_service.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';

class TodoRepositoryMock extends TodoReposytory {
  TodoRepositoryMock(RemoteTodoDataSource remoteTodoDataSource)
      : super(remoteTodoDataSource);
}

void main() {
  final repository = TodoRepositoryMock(
    RemoteTodoDataSource(
      TodoService(
        DioForNative(),
      ),
    ),
  );

  setUp(() {
    debugPrint("Iniciando Suite tests TodoReposytory");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests TodoReposytory");
  });

  test(
      'Deve retornar Lista do tipo TodoModel com 2 ou mais posições, '
      'title = Iniciar Projeto com Teste e isChecked = false ...', () async {
    var todos =
        await repository.getTodos(url: ConstStringUrl.todosAllLocalhost);

    expect(todos, isA<List<TodoModel>>());
    expect(todos.length >= 2, true);
    expect(todos[0].title, 'Iniciar Projeto com Teste');
    expect(todos[0].isChecked, true);
  });

  test(
      'Deve editar valor,retorna  statusCode, 200, data tipo Map'
      ', isChecked igual true...', () async {
    var id = 'abe4c710-9bd1-11ec-ae34-6d0fc1ab51df';
    var param = {"isChecked": true};
    var response = await repository.editToto(
        url: ConstStringUrl.todosAllLocalhost, id: id, param: param);
    expect(response, isA<Map>());
    expect(response['isChecked'], true);
  });
}
