import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/repository/intoxianime_repository.dart';
import '../datasource/intoxianime_datasource.dart';
import '../event/intoxianime_event.dart';
import '../states/intoxianime_state.dart';

class IntoxianimeBloc extends Bloc<IntoxianimeEvent, IntoxianimeState> {
  final IntoxianimeRepository repository;
  IntoxianimeBloc(this.repository) : super(IntoxianimeStateInitial()) {
    on<IntoxianimeEvent>((event, emit) {});
  }
  Future<void> _fechIntoxianimeModes(FetchIntoxianimeEvent event, emit) async {
     emit(IntoxianimeStateLoading());
    try {
      final _animesModes = await repository.getAnimes(perPage: 10, page: 1);
      emit(IntoxianimeStateSuccess(animeModels: _animesModes));
    } on Exception catch (e, s) {
      log("ERROR  _fechIntoxianimeModes : $e",);
      emit(IntoxianimeStateException(message: e.toString(), stackTrace: s));
    }
  }
}
