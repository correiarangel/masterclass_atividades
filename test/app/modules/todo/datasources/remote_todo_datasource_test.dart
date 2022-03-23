import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:masterclass_atividades/app/modules/todo/datasources/remote_todo_datasource.dart';

class RemoteTodoDataSourceMock extends Mock implements RemoteTodoDataSource {}


Response getResponse({
  required data,
  required int statusCode,
}) {
  final Response response = Response(
    data: data,
    statusCode: statusCode,
    requestOptions: RequestOptions(
      path: '',
    ),
  );
  return response;
}

void main() {
  late RemoteTodoDataSourceMock todoRemote;
  final response200 = getResponse(
    data: data,
    statusCode: 200,
  );
  final response200Add = getResponse(
    data: dataParam,
    statusCode: 200,
  );
  final Response responseErroConect = getResponse(
    data: ['Connection refused'],
    statusCode: 500,
  );

  final Response responseErroArgument = getResponse(
    data: ['Invalid argument(s)'],
    statusCode: 500,
  );
  final Response responseExcluir = getResponse(
    data: excluirData,
    statusCode: 200,
  );
  final Response responseEdit = getResponse(
    data: [resMap],
    statusCode: 200,
  );

  setUpAll(() {
    debugPrint("Iniciando Suite testes RemoteTodoDataSource");
  });
  setUp(() {
    todoRemote = RemoteTodoDataSourceMock();
    debugPrint("Iniciando Suite tests");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes RemoteTodoDataSource");
  });

  group('Caminho feliz RemoteTodoDataSource', () {
    test('Deve retorna response StatusCode 200', () async {
      when(() => todoRemote.getTodos(url: 'url'))
          .thenAnswer((invocation) async => response200);

      expect(response200, isA<Response>());
      expect(response200.statusCode, 200);
    });

    test('Deve retorna List com 6 posições em response.data', () async {
      when(() => todoRemote.getTodos(url: 'url'))
          .thenAnswer((invocation) async => response200);

      var list = response200.data['todos'] as List;
      expect(list.length, 6);
    });

    test('Deve editar valor,retorna response statusCode, 200', () async {

      when(() => todoRemote.editar(id: '0', jsonParam: resMap, url: ''))
          .thenAnswer((invocation) async => responseEdit);
      expect(responseEdit, isA<Response>());
      expect(responseEdit.statusCode, 200);
    });
    test('Deve editar valor,retorna response, data tipo Map...', () async {
      final Response response = Response(
        data: [resMap],
        statusCode: 200,
        requestOptions: RequestOptions(
          path: 'api',
        ),
      );
      when(() => todoRemote.editar(id: '0', jsonParam: resMap, url: ''))
          .thenAnswer((invocation) async => response);

      expect(response.data[0], isA<Map>());
    });
    test('Deve editar valor,retorna isChecked igual true...', () async {

      when(() => todoRemote.editar(id: '0', jsonParam:  resMap, url: ''))
          .thenAnswer((invocation) async => responseEdit);
      expect(responseEdit.data[0]['isChecked'], true);
    });

    test('Deve criar novo a faser,retorna response statusCode, 200', () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((_) async => response200Add);
      expect(response200Add, isA<Response>());
      expect(response200Add.statusCode, 200);
    });

    test('Deve criar novo a faser,retorna , data tipo Map ', () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((_) async => response200Add);
      expect(response200Add.data, isA<Map>());
    });
    test('Deve criar novo a faser,retorna title igual a (Lembre 02)', () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((_) async => response200Add);

      expect(response200Add.data['title'], 'Lembre 02');
    });

    test('Deve excluir a faser,retorna response statusCode, 200', () async {
      when(() => todoRemote.excluir(url: '', id: '1'))
          .thenAnswer((_) async => responseExcluir);
      expect(responseExcluir, isA<Response>());
      expect(responseExcluir.statusCode, 200);
    });
    test('Deve excluir a faser,retorna  data tipo Map', () async {
      when(() => todoRemote.excluir(url: '', id: '1'))
          .thenAnswer((_) async => responseExcluir);
      expect(responseExcluir.data, isA<List<Map>>());
    });
    test('Deve excluir a faser,retorna  data tipo Map data mesage ok!',
        () async {
      expect(responseExcluir.data[0]['data'], 'ok!');
    });
  }); //feliz

  group('Caminho Triste RemoteTodoDataSource', () {
    test(
        'Deve retorna response.data List com 1 posições erro:Connection refused',
        () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((invocation) async => responseErroConect);

      expect(responseErroConect, isA<Response>());
      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });

    test(
        'Deve retorna response.data List com 1 posições erro:Invalid argument(s)',
        () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((invocation) async => responseErroArgument);
      expect(responseErroArgument, isA<Response>());
      expect(
          responseErroArgument.data[0]
              .toString()
              .contains('Invalid argument(s)'),
          true);
    });

    test('Deve retorna response statusCode, 500,...', () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((invocation) async => responseErroConect);
      expect(responseErroConect, isA<Response>());
      expect(responseErroConect.statusCode, 500);
    });
    test('Deve retorna,e erro (Connection refused) ao editar valor,...',
        () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((invocation) async => responseErroConect);

      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });
    test('Deve retorna response , data tipo List,e erro ao editar valor,...',
        () async {
      when(() => todoRemote.getTodos(url: ''))
          .thenAnswer((invocation) async => responseErroConect);
      expect(responseErroConect.data, isA<List>());
    });

    test('Deve retorna response statusCode, 500,ao tentar  criar novo a faser',
        () async {
      when(() => todoRemote.addTodo(url: '', jsonParam: dataParam))
          .thenAnswer((invocation) async => responseErroArgument);

      expect(responseErroArgument, isA<Response>());
      expect(responseErroArgument.statusCode, 500);
    });
    test('Deve retorna response data tipo List ,ao tentar  criar novo a faser ',
        () async {
      when(() => todoRemote.addTodo(url: '', jsonParam: dataParam))
          .thenAnswer((invocation) async => responseErroArgument);

      expect(responseErroArgument.data, isA<List>());
    });
    test(
        'Deve retorna errro Invalid argument(s) ,ao tentar criar novo a faser,',
        () async {
      when(() => todoRemote.addTodo(url: '', jsonParam: dataParam))
          .thenAnswer((invocation) async => responseErroArgument);
      expect(
          responseErroArgument.data[0]
              .toString()
              .contains('Invalid argument(s)'),
          true);
    });
    test(
        'Deve retorna errro Invalid argument(s) ,ao tentar criar novo a faser,',
        () async {
      when(() => todoRemote.addTodo(url: '', jsonParam: dataParam))
          .thenAnswer((invocation) async => responseErroConect);
      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });

    test('Deve retorna response statusCode, 500', () async {
      when(() => todoRemote.excluir(url: '', id: '1'))
          .thenAnswer((_) async => responseErroConect);
      expect(responseErroConect, isA<Response>());
      expect(responseErroConect.statusCode, 500);
    });
    test(
        'Deve retorna response List em data ao enviar parametro errado na excluir',
        () async {
      when(() => todoRemote.excluir(url: '', id: '1'))
          .thenAnswer((_) async => responseErroConect);

      expect(responseErroConect.data, isA<List>());
    });

    test(
        'Deve retorna  mesage Connection refused ao enviar'
        ' parametro errado na excluir', () async {
      when(() => todoRemote.excluir(url: '', id: '1'))
          .thenAnswer((_) async => responseErroConect);
      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });
    test(
        'Deve retorna mesage quando argumeto estiver errado Invalid '
        'argument(s) ao enviar parametro errado na excluir', () async {
      when(() => todoRemote.excluir(url: '', id: ''))
          .thenAnswer((_) async => responseErroArgument);

      expect(
          responseErroArgument.data.toString().contains('Invalid argument(s)'),
          true);
    });
  }); //triste
}

/*
para excluir
 "id": "98c657e0-9c8d-11ec-b672-c57aaedf469b"
        
 */

const Map<String, dynamic> resMap = {
  "isChecked": true,
  "id": "abe4c710-9bd1-11ec-ae34-6d0fc1ab51df",
};
const dataParam = {
  "title": "Lembre 02",
  "isChecked": false,
  "id": "xbe4c710-9bd1-11ec-ae34-6d0fc1ab51df",
};

const List<Map> excluirData = [
  {
    "data": "ok!",
  },
];
const data = {
  "todos": [
    {
      "title": "Iniciar Projeto com Teste",
      "isChecked": true,
      "id": "abe4c710-9bd1-11ec-ae34-6d0fc1ab51df",
    },
    {
      "title": "Implementar Dartion",
      "isChecked": true,
      "id": "f349c150-9bd1-11ec-ae34-6d0fc1ab51df"
    },
    {
      "title": "Pesquisar Stream",
      "isChecked": false,
      "id": "fd958ef0-9bd1-11ec-ae34-6d0fc1ab51df"
    },
    {
      "id": "0467ed40-9bd2-11ec-ae34-6d0fc1ab51df",
      "title": "Implementar Strean",
      "isChecked": false
    },
    {
      "id": "0ea82220-9bd2-11ec-ae34-6d0fc1ab51df",
      "title": "Organizar Tributario",
      "isChecked": false
    },
    {
      "title": "Estudar NodeJs",
      "isChecked": true,
      "id": "19fb74b0-9bd2-11ec-ae34-6d0fc1ab51df"
    },
  ]
};
