import 'package:uno/uno.dart';

import '../datasource/intoxianime_datasource.dart';
import '../model/intoxianime_model.dart';
import 'interface/intoxianime_repository_interface.dart';

class IntoxianimeRepository implements IIntoxianimeRepository {
  final IntoxianimeDatasource datasource;
  int _page = 0;
  IntoxianimeRepository(this.datasource);

  @override
  Future<List<IntoxianimeModel>> getAnimes({
    required int page,
    required int perPage,
  }) async {
    _page += page;
    if (_page == 100) _page = 1;

    Response _response = await datasource.getIntoxiAnime(
      page: _page,
      perPage: perPage,
    );

    // ignore: unnecessary_null_comparison
    if (_response != null && _response.status == 200) {
      final _list = _response.data as List;
      final resp = _list.map((jsn) => IntoxianimeModel.fromMap(jsn)).toList();
      return resp;
    } else {
     // List<IntoxianimeModel> list = [];
       throw Exception('error fetching posts');
    }
  }
}
