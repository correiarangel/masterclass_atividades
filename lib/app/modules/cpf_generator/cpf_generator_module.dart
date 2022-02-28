import 'cpf_generator_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cpf_generator_page.dart';

class CpfGeneratorModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CpfGeneratorStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/generatCpfPage', child: (_, args) => const CpfGeneratorPage()),
  ];
}
