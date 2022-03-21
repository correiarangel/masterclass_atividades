import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:masterclass_atividades/app/modules/home/github_repos/datasources/guithub_datasources.dart';
import 'package:masterclass_atividades/app/modules/home/github_repos/model/guithub_model.dart';

class GuitHubDatasourcesMock extends Mock implements GuitHubDatasources {}

void main() {
  final datasource = GuitHubDatasourcesMock();
  setUpAll(() {
    debugPrint("Iniciando Suite testes GuitHubService");
  });
  setUp(() {
    debugPrint("Iniciando Suite tests");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes GuitHubService");
  });

  group('Caminho feliz ;] fetchGuitHubReps', () {
     test('Deve retornar Lista de GuitHubRepsModel com uma posição id = 0 ...',
      () async {
    List<GuitHubRepsModel> reps = [guitRep];
    when(() => datasource.fetchGuitHubReps())
        .thenAnswer((invocation) async => reps);

    expect(reps, isA<List<GuitHubRepsModel>>());
    expect(reps[0].id, 0);
  });
  });
 

  group('Caminho Triste :[ fetchGuitHubReps', () {
    test('Deve retornar null ...', () async {
    const reps = null;
    when(() => datasource.fetchGuitHubReps())
        .thenAnswer((invocation) async => reps);

    expect(reps, null);
  });
  });
  
}

final guitRep = GuitHubRepsModel.empty();
