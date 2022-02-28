import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import 'package:masterclass_atividades/app/modules/playground/playground_module.dart';

void main() {

  setUpAll(() {
    initModule(PlaygroundModule());
  });
}