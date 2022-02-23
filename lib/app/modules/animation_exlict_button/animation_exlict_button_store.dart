import 'package:mobx/mobx.dart';

part 'animation_exlict_button_store.g.dart';

class AnimationExplictButtonStore = _AnimationExplictButtonStoreBase
    with _$AnimationExplictButtonStore;

abstract class _AnimationExplictButtonStoreBase with Store {
  @observable
  bool isAnimatioRun = false;
  @action
  bool toChangesIsloading({isLoadingValue}) {
    if (isLoadingValue != null) {
      isAnimatioRun = isLoadingValue;
    } else if (isAnimatioRun && isLoadingValue == null) {
      isAnimatioRun = false;
    } else if (isAnimatioRun == false && isLoadingValue == null) {
      isAnimatioRun = true;
    }
    return isAnimatioRun;
  }
}
