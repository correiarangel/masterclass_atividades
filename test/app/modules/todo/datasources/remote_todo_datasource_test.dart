import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/todo/datasources/remote_todo_datasource.dart';
import 'package:masterclass_atividades/app/shared/services/todo_service.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';

class RemoteTodoDataSourceMock extends RemoteTodoDataSource {
  RemoteTodoDataSourceMock(TodoService service) : super(service);
}

void main() {
  final todoRemote = RemoteTodoDataSourceMock(
    TodoService(
      DioForNative(),
    ),
  );

  setUp(() {
    debugPrint("Iniciando Suite tests RemoteTodoDataSource");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests RemoteTodoDataSource");
  });
  test('Deve retorna response  List deve conter 9 ou mais posições', () async {
    var response =
        await todoRemote.getTodos(url: ConstStringUrl.todosAllLocalhost);
    var resp = response.data as List;
    expect(response, isA<Response>());
    expect(resp.length >= 9, true);
  });

  test('Deve retorna response response.data = [] ', () async {
    var response =
        await todoRemote.getTodos(url: ConstStringUrl.todosBadUrl);
    expect(response, isA<Response>());
    expect(response.data, []);
  });

  test(
      'Deve editar valor,retorna response statusCode, 200, data tipo Map'
      ', isChecked igual true...', () async {
    var id = 'abe4c710-9bd1-11ec-ae34-6d0fc1ab51df';
    var param = {"isChecked": true};
    var response = await todoRemote.editar(
        url: ConstStringUrl.todosAllLocalhost, id: id, param: param);
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as Map, isA<Map>());
    expect(response.data['isChecked'], true);
  });

  test(
      'Deve criar novo a faser,retorna response statusCode, 200, data tipo Map '
      'e title igual a Lembre 01', () async {
    var param = {"title": "Lembre 01", "isChecked": false};
    var response = await todoRemote.addTodo(
      url: ConstStringUrl.todosAllLocalhost,
      param: param,
    );
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as Map, isA<Map>());
    expect(response.data['title'], 'Lembre 01');
  });

  test(
      'Deve excluir a faser,retorna response statusCode, 200, data tipo Map'
      'e data ok!', () async {
    var id = 'd8a1bc50-9c8e-11ec-b672-c57aaedf469b';
    var response = await todoRemote.excluir(
      url: ConstStringUrl.todosAllLocalhost,
      id: id,
    );
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as Map, isA<Map>());
    expect(response.data['data'], 'ok!');
  });
}

/*
para excluir
 "id": "98c657e0-9c8d-11ec-b672-c57aaedf469b"
        
 */