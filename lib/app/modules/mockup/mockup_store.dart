import 'package:mobx/mobx.dart';

part 'mockup_store.g.dart';

class MockupStore = _MockupStoreBase with _$MockupStore;

abstract class _MockupStoreBase with Store {}
