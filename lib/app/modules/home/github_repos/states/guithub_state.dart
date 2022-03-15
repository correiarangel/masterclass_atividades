import '../model/guithub_model.dart';

class GuitHubState {}

class InitialGuitHubState extends GuitHubState {}

class LoadingGuitHubState extends GuitHubState {}

class ExceptionGuitHubState extends GuitHubState {
  final String message;
  final String? stackTrace;
  ExceptionGuitHubState({required this.message, this.stackTrace});
}

class SuccessGuitHubState extends GuitHubState {
  final List<GuitHubRepsModel> repoModels;
  SuccessGuitHubState(this.repoModels);
}
