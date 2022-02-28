
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/cpf_generator/cpf_generator_module.dart';
 
void main() {

  setUpAll(() {
    initModule(CpfGeneratorModule());
  });
}