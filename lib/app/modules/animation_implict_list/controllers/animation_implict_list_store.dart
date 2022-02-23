import 'package:mobx/mobx.dart';

import '../../../shared/models/heroi_model.dart';
import '../../../shared/util/value/const_srtring.dart';

part 'animation_implict_list_store.g.dart';

class AnimationImplictListStore = _AnimationImplictListStoreBase
    with _$AnimationImplictListStore;

abstract class _AnimationImplictListStoreBase with Store {
  Future<void> fillHeroiModel() async {
    List<HeroiModel> _heroiModels = creatList();
    toChangesHeroiModelList(listValue: _heroiModels);
  }

  List<HeroiModel> creatList() {
    List<HeroiModel> _heroiModels = [];
    for (var i = 0; i < 10; i++) {
      HeroiModel heroiModel = HeroiModel(
        descricao: ConstString.sobreHeroi,
        id: i,
        name: 'Super Heroi - $i',
        poder: 'Teia Super Força',
      );
      _heroiModels.add(heroiModel);
    }
    return _heroiModels;
  }

  @observable
  List<HeroiModel>? heroiModels = [];
  @action
  List<HeroiModel> toChangesHeroiModelList({
    required List<HeroiModel> listValue,
  }) =>
      heroiModels = listValue;
}
