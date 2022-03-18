import '../model/intoxianime_model.dart';

abstract class IntoxianimeState {}

class IntoxianimeStateInitial extends IntoxianimeState {}

class IntoxianimeStateLoading extends IntoxianimeState {}

class IntoxianimeStateException extends IntoxianimeState {
  final StackTrace? stackTrace;
  final String message;

  IntoxianimeStateException({this.stackTrace, required this.message});
}

class IntoxianimeStateSuccess extends IntoxianimeState {
  final List<IntoxianimeModel> animeModels;

  IntoxianimeStateSuccess(this.animeModels);
}
