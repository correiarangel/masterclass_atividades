import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/animation_implict_button/animation_implict_button_module.dart';
 
void main() {

  setUpAll(() {
    initModule(AnimationImplictButtonModule());
  });
}