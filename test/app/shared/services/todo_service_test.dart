import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/shared/services/todo_service.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';
import 'package:mocktail/mocktail.dart';

class TodoServiceMock extends Mock implements TodoService {}

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
  late TodoServiceMock service;
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
    debugPrint("Iniciando Suite testes TodoService");
  });
  setUp(() {
    service = TodoServiceMock();
    debugPrint("Iniciando Suite tests");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes TodoService");
  });

  group('Caminho feliz TodoService', () {
    test('Deve retorna response StatusCode 200', () async {
      when(() => service.get(url: 'url'))
          .thenAnswer((invocation) async => response200);

      expect(response200, isA<Response>());
      expect(response200.statusCode, 200);
    });

    test('Deve retorna List com 6 posições em response.data', () async {
      when(() => service.get(url: 'url'))
          .thenAnswer((invocation) async => response200);
      var list = response200.data['todos'] as List;
      expect(list.length, 6);
    });

    test('Deve editar valor,retorna response statusCode, 200', () async {
      when(() => service.put(id: 'i123', url: 'url', jsonParam: resMap))
          .thenAnswer((invocation) async => responseEdit);
      expect(responseEdit, isA<Response>());
      expect(responseEdit.statusCode, 200);
    });
    test('Deve editar valor,retorna response, data tipo Map...', () async {
      when(() => service.put(id: 'i123', url: 'url', jsonParam: resMap))
          .thenAnswer((invocation) async => responseEdit);

      expect(responseEdit.data[0], isA<Map>());
    });
    test('Deve editar valor,retorna isChecked igual true...', () async {
      when(() => service.put(id: 'i123', url: 'url', jsonParam: resMap))
          .thenAnswer((invocation) async => responseEdit);
      expect(responseEdit.data[0]['isChecked'], true);
    });

    test('Deve criar novo a faser,retorna response statusCode, 200', () async {
      when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => response200Add);
      expect(response200Add, isA<Response>());
      expect(response200Add.statusCode, 200);
    });

    test('Deve criar novo a faser,retorna , data tipo Map ', () async {
      when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => response200Add);
      expect(response200Add.data, isA<Map>());
    });
    test('Deve criar novo a faser,retorna title igual a (Lembre 02)', () async {
      when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => response200Add);

      expect(response200Add.data['title'], 'Lembre 02');
    });

    test('Deve excluir a faser,retorna response statusCode, 200', () async {
      when(() => service.delete(url: '', id: '1'))
          .thenAnswer((_) async => responseExcluir);
      expect(responseExcluir, isA<Response>());
      expect(responseExcluir.statusCode, 200);
    });
    test('Deve excluir a faser,retorna  data tipo Map', () async {
      when(() => service.delete(url: '', id: '1'))
          .thenAnswer((_) async => responseExcluir);
      expect(responseExcluir.data, isA<List<Map>>());
    });
    test('Deve excluir a faser,retorna  data tipo Map data mesage ok!',
        () async {
      expect(responseExcluir.data[0]['data'], 'ok!');
    });
  }); //feliz


group('Caminho Triste TodoService', () {
    test(
        'Deve retorna response.data List com 1 posições erro:Connection refused',
        () async {
      when(() => service.get(url: ''))
          .thenAnswer((invocation) async => responseErroConect);

      expect(responseErroConect, isA<Response>());
      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });

    test(
        'Deve retorna response.data List com 1 posições erro:Invalid argument(s)',
        () async {
      when(() => service.get(url: ''))
          .thenAnswer((invocation) async => responseErroArgument);
      expect(responseErroArgument, isA<Response>());
      expect(
          responseErroArgument.data[0]
              .toString()
              .contains('Invalid argument(s)'),
          true);
    });

    test('Deve retorna response statusCode, 500,...', () async {
      when(() => service.get(url: ''))
          .thenAnswer((invocation) async => responseErroConect);
      expect(responseErroConect, isA<Response>());
      expect(responseErroConect.statusCode, 500);
    });
    test('Deve retorna,e erro (Connection refused) ao editar valor,...',
        () async {
      when(() => service.get(url: ''))
          .thenAnswer((invocation) async => responseErroConect);

      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });
    test('Deve retorna response , data tipo List,e erro ao editar valor,...',
        () async {
      when(() => service.get(url: ''))
          .thenAnswer((_) async => responseErroConect);
      expect(responseErroConect.data, isA<List>());
    });

    test('Deve retorna response statusCode, 500,ao tentar criar novo a faser',
        () async {
      when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => responseErroArgument);

      expect(responseErroArgument, isA<Response>());
      expect(responseErroArgument.statusCode, 500);
    });
    test('Deve retorna response data tipo List ,ao tentar  criar novo a faser ',
        () async {
      when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => responseErroArgument);

      expect(responseErroArgument.data, isA<List>());
    });
    test(
        'Deve retorna errro Invalid argument(s) ,ao tentar criar novo a faser,',
        () async {
    when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => responseErroArgument);
      expect(
          responseErroArgument.data[0]
              .toString()
              .contains('Invalid argument(s)'),
          true);
    });
    test(
        'Deve retorna errro Invalid argument(s) ,ao tentar criar novo a faser,',
        () async {
        when(() => service.post(url: '', jsonParam: dataParam))
          .thenAnswer((_) async => responseErroConect);
      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });

    test('Deve retorna response statusCode, 500', () async {
      when(() => service.delete(url: '', id: '1'))
          .thenAnswer((_) async => responseErroConect);
      expect(responseErroConect, isA<Response>());
      expect(responseErroConect.statusCode, 500);
    });
    test(
        'Deve retorna response List em data ao receber parametro errado na excluir',
        () async {
        when(() => service.delete(url: '', id: '1'))
          .thenAnswer((_) async => responseErroConect);

      expect(responseErroConect.data, isA<List>());
    });

    test(
        'Deve retorna  mesage Connection refused ao receber'
        ' parametro errado na excluir', () async {
       when(() => service.delete(url: '', id: '1'))
          .thenAnswer((_) async => responseErroConect);
      expect(
          responseErroConect.data[0].toString().contains('Connection refused'),
          true);
    });
    test(
        'Deve retorna mesage quando argumeto estiver errado Invalid '
        'argument(s) ao receber parametro errado na excluir', () async {
      when(() => service.delete(url: '', id: ''))
          .thenAnswer((_) async => responseErroArgument);

      expect(
          responseErroArgument.data.toString().contains('Invalid argument(s)'),
          true);
    });
  }); //triste

}

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
