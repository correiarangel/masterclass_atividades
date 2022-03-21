import '../../model/intoxianime_model.dart';

abstract class IIntoxianimeRepository {
  Future<List<IntoxianimeModel>> getAnimes({
    required int perPage,
    required int page,
  });
}