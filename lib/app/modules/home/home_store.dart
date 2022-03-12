import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/models/tecnologi_model.dart';
import '../../shared/util/value/const_list_tecnologi.dart';

import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/util/check_internet.dart';
import '../../shared/util/general_version.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final genVersion = Modular.get<GeneralVersion>();
  final testInternet = Modular.get<CheckInternet>();

  @observable
  bool progssVariation = false;
  @action
  // ignore: avoid_positional_boolean_parameters
  bool changesProgressVariation(bool value) => progssVariation = value;
  @observable
  int currentIndex = 0;

  @action
  int toChangesPage(int index) => currentIndex = index;

  @observable
  String dateUpgrade = "";
  @action
  String changeDateUpgrade(String? value) =>
      value != null ? dateUpgrade = value : dateUpgrade;

  @observable
  String title = 'Atividades';
  @action
  String changesTitle({required String valueTitle}) => title = valueTitle;

  launchURL(_url) async {
    final url = Uri.encodeFull(_url);
    await launch(url);
  }

  @observable
  String? version = "";
  @action
  changeVersion() async {
    version = await genVersion.getBuildAndVersion();
  }

  setFalseProgress() => changesProgressLink(false);

  @observable
  bool progressLink = false;
  @action
  // ignore: avoid_positional_boolean_parameters
  bool changesProgressLink(bool value) => progressLink = value;

  @observable
  bool? isNet;
  @action
  changesIsNet() async {
    return isNet = await testInternet.isInternet();
  }

  List<TecnologiModel> fillListHoriz() {
    return ConstList.listTecnologi.map((tcmodel) {
      return TecnologiModel.fromMap(tcmodel);
    }).toList();
  }

}
