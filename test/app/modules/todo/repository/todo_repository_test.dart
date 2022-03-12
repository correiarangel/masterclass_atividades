// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/todo/models/todo_model.dart';
import 'package:masterclass_atividades/app/modules/todo/repository/todo_repository.dart';

import 'package:mocktail/mocktail.dart';

class TodoRepositoryMock extends Mock implements TodoReposytory {}

void main() {
  late TodoRepositoryMock repository;
  setUpAll(() {
    debugPrint("Iniciando Suite testes TodoReposytory");
  });
  setUp(() {
    debugPrint("Iniciando tests");
    repository = TodoRepositoryMock();
  });

  tearDown(() {
    debugPrint("Finalizando tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes TodoReposytory");
  });
  group('Caminho Filiz', () {
    test('Deve retornar Lista TodoModel com (3 posições) ...', () async {
      when(() => repository.getTodos()).thenAnswer((invocation) async => todos);
      expect(todos, isA<List<TodoModel>>());
      expect(todos.length, 3);
    });

    test('Deve retornar title igual (Iniciar Projeto com Teste)  ...',
        () async {
      when(() => repository.getTodos()).thenAnswer((invocation) async => todos);
      expect(todos[0].title, 'Iniciar Projeto com Teste');
    });
    test('Deve retornar (isChecked igual false) ...', () async {
      when(() => repository.getTodos()).thenAnswer((invocation) async => todos);
      expect(todos[0].isChecked, false);
    });

    test('Deve retorna Map com parametro isChecked true ...', () async {
      when(() => repository.editToto(id: '1', param: {}))
          .thenAnswer((invocation) async => resMap);
      expect(resMap, isA<Map>());
      expect(resMap['isChecked'], true);
    });

    test('Deve retorna Map com parametro title igual a  (Lembre 02)...',
        () async {
      when(() => repository.addToto(param: dataParam))
          .thenAnswer((invocation) async => dataParam);
      expect(dataParam, isA<Map>());
      expect(dataParam['title'], 'Lembre 02');
    });
    test('Deve retorna Map com parametro isChecked false ...', () async {
      when(() => repository.excluirToto(id: '112'))
          .thenAnswer((_) async => dataParam);
      expect(dataParam, isA<Map>());
      expect(dataParam['isChecked'], false);
    });
  }); //feliz

  group('Caminho Triste ', () {
    test('Deve retornar Lista vazia []  ...', () async {
      when(() => repository.getTodos())
          .thenAnswer((invocation) async => todosZiro);
      expect(todosZiro, []);
    });

    test('Deve retornar null ao buscar lista ...', () async {
      var response;
      when(() => repository.getTodos())
          .thenAnswer((invocation) async => response);
      expect(response, null);
    });

    test('Deve retorna Null ao tentar editar ...', () async {
      var response;
      when(() => repository.editToto(id: '1', param: {}))
          .thenAnswer((_) async => response);
      expect(response, null);
    });

    test('Deve retorna Null ao tenta adicinar ...', () async {
      var response;
      when(() => repository.addToto(param: {}))
          .thenAnswer((_) async => response);
      expect(response, null);
    });

    test('Deve retorna Null ao tentar excluir ...', () async {
      var response;
      when(() => repository.excluirToto(id: '01x'))
          .thenAnswer((_) async => response);
      expect(response, null);
    });
  });
}

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
const Map resMap = {
  "isChecked": true,
  "id": "abe4c710-9bd1-11ec-ae34-6d0fc1ab51df",
};

const List<TodoModel> todosZiro = [];
const List<TodoModel> todos = [
  TodoModel(
      id: 'abe4c710-9bd1-11ec-ae34-6d0fc1ab51df',
      title: 'Iniciar Projeto com Teste',
      isChecked: false),
  TodoModel(
      id: 'f349c150-9bd1-11ec-ae34-6d0fc1ab51df',
      title: 'IImplementar Dartion',
      isChecked: false),
  TodoModel(
      id: 'fd958ef0-9bd1-11ec-ae34-6d0fc1ab51df',
      title: 'Pesquisar Stream',
      isChecked: false),
];
