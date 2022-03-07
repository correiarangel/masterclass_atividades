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
  group('Caminho Filiz getTodos', () {
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
  });

  group('Caminho Triste getTodos', () {
    test('Deve retornar Lista vazia []  ...', () async {
      when(() => repository.getTodos())
          .thenAnswer((invocation) async => todosZiro);
      expect(todosZiro, []);
    });
  });

  group('Caminho Feliz editTodo', () {
    test('Deve retorna Map com parametro isChecked true ...', () async {
      when(() => repository.editToto(id: '1', url: 'api', param: {}))
          .thenAnswer((invocation) async => resMap);
      expect(resMap, isA<Map>());
      expect(resMap['isChecked'], true);
    });
  });

  group('Caminho Triste editTodo', () {
    test('Deve retorna Null...', () async {
      var response;
      when(() => repository.editToto(id: '1', url: 'api', param: {}))
          .thenAnswer((invocation) async => response);
      expect(response, null);
    });
  });
}

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
