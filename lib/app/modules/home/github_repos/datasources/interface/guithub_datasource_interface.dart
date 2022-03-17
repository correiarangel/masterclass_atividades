import '../../model/guithub_model.dart';

abstract class IGuitHubDatasources {
  Future<List<GuitHubRepsModel>> fetchGuitHubReps();
}
