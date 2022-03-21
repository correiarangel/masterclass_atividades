import 'dart:developer';

import '../../../shared/util/value/const_srtring_url.dart';
import 'package:uno/uno.dart';
import 'interface/intoxianime_datasource_interface.dart';

class IntoxianimeDatasource implements IIntoxianimeDatasource {
  final Uno uno;

  IntoxianimeDatasource(this.uno);

  @override
  Future<Response> getIntoxiAnime({
    required int page,
    required int perPage,
  }) async {
    late Response response;
    final String urlFull =
        '${ConstStringUrl.intoximeUrl}/posts&page=$page&per_page=$perPage';
    try {
      response = await uno.get(urlFull);
    } on Exception catch (e, s) {
      log('GET/ TodoService', error: e, stackTrace: s);
      response = Response(
        request: Request(
          headers: {},
          timeout: Duration.zero,
          method: '',
          uri: Uri(),
        ),
        headers: {},
        status: 500,
        data: [],
      );
    }
    return response;
  }
}
