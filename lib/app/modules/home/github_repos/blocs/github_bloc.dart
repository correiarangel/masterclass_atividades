import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../datasources/guithub_datasources.dart';
import '../events/guithub_event.dart';

import '../states/guithub_state.dart';

class GitHubBloc extends Bloc<GuitHubEvent, GuitHubState> {
  final GuitHubDatasources sources;
  GitHubBloc(this.sources) : super(InitialGuitHubState()) {
    on<FetchGuitHubEvent>(_fetchGuitHubReps);
  }
  Future<void> _fetchGuitHubReps(FetchGuitHubEvent event, emit) async {
    emit(LoadingGuitHubState());
    try {
      final repoModels = await sources.fetchGuitHubReps();
      emit(SuccessGuitHubState(repoModels));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(ExceptionGuitHubState(message: e.toString()));
    }
  }
}
