import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import 'package:masterclass_atividades/app/modules/animation_exlict_list/animation_exlict_list_module.dart';

void main() {

  setUpAll(() {
    initModule(AnimationExlictListModule());
  });
}