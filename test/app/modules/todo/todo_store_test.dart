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

  group('Caminho Feliz ;] ', () {
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

    test('Deve retornar Map isChecked  true ...', () async {
      when(() => store.editTodo(valueChecked: true, id: resMap['id']))
          .thenAnswer((_) async => resMap);
      expect(resMap, isA<Map>());
      expect(resMap['isChecked'], true);
    });

    test('Deve retornar Map com title Lembrete 01 ...', () async {
      when(() => store.addTodo(title: 'title', valueChecked: false))
          .thenAnswer((_) async => paranMap);
      expect(paranMap, isA<Map>());
      expect(paranMap['title'], 'Lembrete 01');
    });
    test('Deve retornar Map data OK! ...', () async {
      Map _paranMap = {"data": "OK!"};
      when(() => store.excluirTodo(id: '123'))
          .thenAnswer((_) async => _paranMap);
      expect(_paranMap, isA<Map>());
      expect(_paranMap['data'], 'OK!');
    });
  });

  group('Caminho triste :[', () {
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

    test('Deve retornar  Map vazio ...', () async {
      when(() => store.editTodo(id: '', valueChecked: false))
          .thenAnswer((_) async => resMapZiro);
      expect(resMapZiro, isA<Map>());
      expect(resMapZiro.length, 0);
    });

    test('Deve retornar Map vazio, ao adicionar ...', () async {
      when(() => store.addTodo(
            title: '',
            valueChecked: false,
          )).thenAnswer((_) async => resMapZiro);
      expect(resMapZiro, isA<Map>());
      expect(resMapZiro.length, 0);
    });

    test('Deve retornar Map vazio, ao tentar excluir ...', () async {
      when(() => store.excluirTodo(id: '')).thenAnswer((_) async => resMapZiro);
      expect(resMapZiro, isA<Map>());
      expect(resMapZiro.length, 0);
    });
  });
}

const Map resMapZiro = {};
const Map resMap = {
  "isChecked": true,
  "id": "abe4c710-9bd1-11ec-ae34-6d0fc1ab51df",
};
const Map paranMap = {
  "title": "Lembrete 01",
  "isChecked": false,
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
