import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/intoxianime_repository.dart';

import '../event/intoxianime_event.dart';
import '../states/intoxianime_state.dart';

class IntoxianimeBloc extends Bloc<IntoxianimeEvent, IntoxianimeState> {
  final IntoxianimeRepository repository;

  IntoxianimeBloc(this.repository) : super(IntoxianimeStateInitial()) {
    on<IntoxianimeEvent>(_fechIntoxianimeModes);
  }

  Future<void> _fechIntoxianimeModes(IntoxianimeEvent event, emit) async {
    emit(IntoxianimeStateLoading());
    try {
      final animeModes = await repository.getAnimes(perPage: 10, page: 1);
      emit(IntoxianimeStateSuccess(animeModes));
    } on Exception catch (e, s) {
      log(
        "ERROR  _fechIntoxianimeModes : $e",
      );
      emit(IntoxianimeStateException(message: e.toString(), stackTrace: s));
    }
  }
}
