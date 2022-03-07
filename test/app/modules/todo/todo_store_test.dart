import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/todo/models/todo_model.dart';

import 'package:masterclass_atividades/app/modules/todo/todo_store.dart';

import 'package:mocktail/mocktail.dart';

class TodoStoreMock extends Mock implements TodoStore {}

void main() {
 late TodoStoreMock store;
  setUpAll(() {
    debugPrint("Iniciando Suite tests TodoStoreMock");
  });
  setUp(() {
    debugPrint("Iniciando tests");
    store = TodoStoreMock();
  });

  tearDown(() {
    debugPrint("Finalizando tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite tests TodoStoreMock");
  });

  group('Caminho Feliz ;] getAllTodos', () {
    test('Deve retornar Lista de TodoModel  ...', () async {
      when(() => store.getAllTodos()).thenAnswer(
        (_) async => todos,
      );
      expect(todos, isA<List<TodoModel>>());
    });
    test('Deve retornar Lista de TodoModel com 3 posição, ...', () async {
      when(() => store.getAllTodos()).thenAnswer(
        (_) async => todos,
      );
      expect(todos.length, 3);
    });
    test(
        'Deve retornar Lista de TodoModel com title Iniciar Projeto com Teste...',
        () async {
      when(() => store.getAllTodos()).thenAnswer(
        (_) async => todos,
      );
      expect(todos[0].title, 'Iniciar Projeto com Teste');
    });
  });

  group('Caminho triste :[ getAllTodos', () {
    test('Deve retornar Lista TodoModel vazia caso haja erro, ...', () async {
      when(() => store.getAllTodos()).thenAnswer(
        (_) async => todosZiro,
      );
      expect(todosZiro.isEmpty, true);
    });
    test('Deve retornar throwsException...', () async {
      var errorException = Exception();
      when(() => store.getAllTodos()).thenThrow((err) async => errorException);
      expect(errorException, isA<Exception>());
    });
  });

  group('Caminho Feliz ;] editTodo', () {
    test('Deve retornar Map isChecked  true ...', () async {
      when(() => store.editTodo(valueChecked: true, id: resMap['id']))
          .thenAnswer((invocation) async => resMap);
      expect(resMap, isA<Map>());
      expect(resMap['isChecked'], true);
    });
  });

  group('Caminho Triste :[ editTodo', () {
    test('Deve retornar Map vazio, isChecked null ...', () async {
      when(() => store.editTodo(valueChecked: true, id: resMap['id']))
          .thenAnswer((invocation) async => resMap);
      expect(resMap, isA<Map>());
      expect(resMap['isChecked'], true);
    });
  });
}

const Map resMap = {
  "isChecked": true,
  "id": "abe4c710-9bd1-11ec-ae34-6d0fc1ab51df",
};

const todosZiro = <TodoModel>[];
const todos = <TodoModel>[
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
