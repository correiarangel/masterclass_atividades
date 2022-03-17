import 'package:dio/dio.dart';
import '../model/guithub_model.dart';
import '../../../../shared/util/value/const_srtring_url.dart';
import 'interface/guithub_datasource_interface.dart';

class GuitHubDatasources implements IGuitHubDatasources {
  final Dio dio;

  GuitHubDatasources(this.dio);

  @override
  Future<List<GuitHubRepsModel>> fetchGuitHubReps() async {
    final response = await dio.get(ConstStringUrl.guitHubRepsUrl);

    // ignore: unnecessary_null_comparison
    if (response != null && response.statusCode == 200) {
      final _list = response.data as List;
      final repos = _list.map((jsn) => GuitHubRepsModel.fromMap(jsn)).toList();
      return repos;
    } else {
      List<GuitHubRepsModel> list = [];
      return list;
    }
  }
}
