import '../../shared/models/heroi_model.dart';
import '../../shared/util/value/const_srtring.dart';
import 'package:mobx/mobx.dart';

part 'animation_exlict_list_store.g.dart';

class AnimationExplictListStore = _AnimationExplictListStoreBase
    with _$AnimationExplictListStore;

abstract class _AnimationExplictListStoreBase with Store {
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
        name: 'Homem Aranha - $i',
        poder: '',
      );
      _heroiModels.add(
        heroiModel,
      );
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
