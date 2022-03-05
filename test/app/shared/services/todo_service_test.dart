import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/shared/services/todo_service.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';

class TodoServiceMock extends TodoService {
  TodoServiceMock(Dio dio) : super(dio);
}

void main() {
  final service = TodoServiceMock(DioForNative());

  setUp(() {
    debugPrint("Iniciando Suite tests TodoService");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests TodoService");
  });
  test('Deve retorna response statusCode, 200, response.data = List ',
      () async {
    var response = await service.get(url: ConstStringUrl.todosAllLocalhost);
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as List, isA<List>());
  });

  test('Deve retorna response statusCode, 500  ', () async {
    var response = await service.get(url: ConstStringUrl.todosBadUrl);
    expect(response, isA<Response>());
    expect(response.statusCode, 500);
    expect(response.data, []);
  });


  test('Deve editar valor,retorna response statusCode, 200, data tipo Map',
      () async {
    var id = 'abe4c710-9bd1-11ec-ae34-6d0fc1ab51df';
    var param = {"isChecked": false};
    var response = await service.put(
      url: ConstStringUrl.todosAllLocalhost,
      id: id,
      jsonParam: param,
    );
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as Map, isA<Map>());
  });

  test(
      'Deve criar novo a faser,retorna response statusCode, 200, data tipo Map',
      () async {
    var param = {"title": "Estudar inglês", "isChecked": false};
    var response = await service.post(
      url: ConstStringUrl.todosAllLocalhost,
      jsonParam: param,
    );
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as Map, isA<Map>());
  });

  test('Deve excluir a faser,retorna response statusCode, 200, data tipo Map',
      () async {
    //var param = {"title": "Estudar inglês", "isChecked": false};
    var id = 'be91f670-9bdc-11ec-8d22-d3af575f30af';
    var response = await service.delete(
      url: ConstStringUrl.todosAllLocalhost,
      id: id,
    );
    expect(response, isA<Response>());
    expect(response.statusCode, 200);
    expect(response.data as Map, isA<Map>());
  });
}
