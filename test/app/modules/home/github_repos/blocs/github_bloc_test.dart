import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/home/github_repos/datasources/guithub_datasources.dart';
import 'package:mocktail/mocktail.dart';

import 'package:masterclass_atividades/app/modules/home/github_repos/blocs/github_bloc.dart';
import 'package:masterclass_atividades/app/modules/home/github_repos/events/guithub_event.dart';
import 'package:masterclass_atividades/app/modules/home/github_repos/model/guithub_model.dart';
import 'package:masterclass_atividades/app/modules/home/github_repos/states/guithub_state.dart';

class GuitHubServiceMock extends Mock implements GuitHubDatasources {}

void main() {
  final service = GuitHubServiceMock();

  setUpAll(() {
    debugPrint("Iniciando Suite testes GitHubBloc");
  });
  setUp(() {
    debugPrint("Iniciando Suite tests");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes GitHubBloc");
  });

  group(
    'Caminho feliz ;]',
    () {
      blocTest<GitHubBloc, GuitHubState>(
        'Deve retornar lista de Repositorios ...',
        build: () {
          List<GuitHubRepsModel> list = [GuitHubRepsModel.empty()];
          when(() => service.fetchGuitHubReps()).thenAnswer((_) async => list);
          return GitHubBloc(service);
        },
        act: (bloc) => bloc.add(FetchGuitHubEvent()),
        wait: const Duration(seconds: 1),
        expect: () => [
          isA<LoadingGuitHubState>(),
          isA<SuccessGuitHubState>(),
        ],
 
      );
    },
  );

  group(
    'Caminho Triste :[',
    () {
      blocTest<GitHubBloc, GuitHubState>(
        'Deve retornar List vazia...',
        build: () {
          when(() => service.fetchGuitHubReps())
              .thenThrow((_) async => Exception());
          return GitHubBloc(service);
        },
        act: (bloc) => bloc.add(FetchGuitHubEvent()),
        wait: const Duration(seconds: 1),
        errors: () => [],
        expect: () => [
          isA<LoadingGuitHubState>(),
          isA<ExceptionGuitHubState>(),
        ],
      );
    },
  );
}
