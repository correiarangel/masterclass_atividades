import 'package:uno/uno.dart';

abstract class IIntoxianimeDatasource {
  Future<Response> getIntoxiAnime({
    required int perPage,
    required int page,
  });
}
