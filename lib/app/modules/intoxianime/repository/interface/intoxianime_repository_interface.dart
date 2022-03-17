import '../../model/intoxianime_model.dart';

abstract class IIntoxianimeRepository {
  Future<List<IntoxianimeModel>> getAnimes();
}