import 'package:mobx/mobx.dart';

part 'playground_store.g.dart';

class PlaygroundStore = _PlaygroundStoreBase with _$PlaygroundStore;
abstract class _PlaygroundStoreBase with Store {

@observable
  bool isLoading = false;
  @action
  bool toChangesIsloading({isLoadingValue}) {
    if (isLoadingValue != null) {
      isLoading = isLoadingValue;
    } else if (isLoading && isLoadingValue == null) {
      isLoading = false;
    } else if (isLoading == false && isLoadingValue == null) {
      isLoading = true;
    }
    return isLoading;
  }
}