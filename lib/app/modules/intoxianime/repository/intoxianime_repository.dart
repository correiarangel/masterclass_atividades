import 'package:flutter/cupertino.dart';
import 'package:uno/uno.dart';

import '../datasource/intoxianime_datasource.dart';
import '../model/intoxianime_model.dart';
import 'interface/intoxianime_repository_interface.dart';

class IntoxianimeRepository implements IIntoxianimeRepository {
  final IntoxianimeDatasource datasource;

  IntoxianimeRepository(this.datasource);

  @override
  Future<List<IntoxianimeModel>> getAnimes(
      {@required perPage, @required page}) async {
    Response _response =
        await datasource.getIntoxiAnime(perPage: perPage, page: page);

    // ignore: unnecessary_null_comparison
    if (_response != null && _response.status == 200) {
      final _list = _response.data as List;
      final resp = _list.map((jsn) => IntoxianimeModel.fromMap(jsn)).toList();
      return resp;
    } else {
      List<IntoxianimeModel> list = [];
      return list;
    }
  }
}
