import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/blocs/intoxianime_bloc.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/event/intoxianime_event.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/model/intoxianime_model.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/repository/intoxianime_repository.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/states/intoxianime_state.dart';
import 'package:mocktail/mocktail.dart';

class IntoxianimeRepositoryMock extends Mock implements IntoxianimeRepository {}

void main() {
  final repository = IntoxianimeRepositoryMock();

  setUpAll(() {
    debugPrint("Iniciando Suite testes IntoxianimeRepository");
  });
  setUp(() {
    debugPrint("Iniciando Suite tests");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes IntoxianimeRepository");
  });

  group(
    'Caminho feliz ;]',
    () {
      blocTest<IntoxianimeBloc, IntoxianimeState>(
        'Deve retornar lista de IntoxianimeModel ...',
        build: () {
          List<IntoxianimeModel> list = [IntoxianimeModel.empty()];
          when(() => repository.getAnimes(page: 1, perPage: 10))
              .thenAnswer((_) async => list);
          return IntoxianimeBloc(repository);
        },
        act: (bloc) => bloc.add(FetchIntoxianimeEvent()),
        wait: const Duration(seconds: 1),
        expect: () => [
          isA<IntoxianimeStateLoading>(),
          isA<IntoxianimeStateSuccess>(),
        ],
      );
    },
  );

  group(
    'Caminho Triste :[',
    () {
/* 
      blocTest<IntoxianimeBloc, IntoxianimeState>(
        'Deve retornar List vazia...',
        build: () {
      
          when(() => repository.getAnimes(page: -1, perPage: -1))
              .thenThrow((_) async => throwsException);
          return IntoxianimeBloc(repository);
        },
        act: (bloc) => bloc.add(FetchIntoxianimeEvent()),
        wait: const Duration(seconds: 3),
        errors: () => throwsException,
        expect: () => [
          isA<IntoxianimeStateLoading>(),
          isA<IntoxianimeStateSuccess>(),
        ],
      ); */
    },
  );
}
