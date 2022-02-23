import 'package:mobx/mobx.dart';

part 'animation_implict_button_store.g.dart';

class AnimationImplictButtonStore = _AnimationImplictButtonStoreBase with _$AnimationImplictButtonStore;
abstract class _AnimationImplictButtonStoreBase with Store {

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

