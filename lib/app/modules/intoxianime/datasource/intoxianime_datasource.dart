import 'dart:developer';

import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';
import 'package:uno/uno.dart';
import 'interface/intoxianime_datasource_interface.dart';

class IntoxianimeDatasource implements IIntoxianimeDatasource {
  final Uno uno;

  IntoxianimeDatasource(this.uno);

  @override
  Future<Response> getIntoxiAnime(
      {required int perPage, required int page}) async {
    late Response response;
    final String urlFull =
        '${ConstStringUrl.intoximeUrl}/posts&page=$perPage&per_page=$page';
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
