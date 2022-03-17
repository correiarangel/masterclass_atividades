import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:masterclass_atividades/app/modules/intoxianime/model/intoxianime_model.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/repository/intoxianime_repository.dart';

class IntoxianimeRepositoryMock extends Mock implements IntoxianimeRepository {}

void main() {
  late IntoxianimeRepositoryMock repository;
  setUpAll(() {
    debugPrint("Iniciando Suite testes TodoReposytory");
  });
  setUp(() {
    debugPrint("Iniciando tests");
    repository = IntoxianimeRepositoryMock();
  });

  tearDown(() {
    debugPrint("Finalizando tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes TodoReposytory");
  });
  test('Deve retorna List IntoxianimeModel', () async {
    when(
      () => repository.getAnimes(perPage: 1, page: 1),
    ).thenAnswer((_) async => intoxiaZiro);

    expect(intoxiaOne, isA<List<IntoxianimeModel>>());
  });
  test('Deve retorna true para Lista IntoxianimeModel zerada...', () async {
    when(
      () => repository.getAnimes(perPage: 1, page: 1),
    ).thenAnswer((_) async => intoxiaZiro);

    expect(intoxiaZiro.isEmpty, true);
  });
  test('Deve retorna List IntoxianimeModel com 1 posição', () async {
    when(
      () => repository.getAnimes(perPage: 1, page: 1),
    ).thenAnswer((_) async => intoxiaZiro);

    expect(intoxiaOne.length, 1);
  });
}

const intoxiaZiro = <IntoxianimeModel>[];
final intoxiaOne = <IntoxianimeModel>[IntoxianimeModel.empty()];
