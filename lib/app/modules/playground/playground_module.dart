import 'package:flutter_modular/flutter_modular.dart';

import '../cpf_generator/cpf_generator_module.dart';
import '../intoxianime/intoxianime_module.dart';
import '../login_get_money/login_get_money_module.dart';
import '../login_tinder/login_tinder_module.dart';
import '../todo/todo_module.dart';
import 'playground_page.dart';
import 'playground_store.dart';

class PlaygroundModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PlaygroundStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/playgroundPage', child: (_, args) => const PlaygroundPage()),
    ModuleRoute(Modular.initialRoute, module: LoginGetMoneyModule()),
    ModuleRoute(Modular.initialRoute, module: LoginTinderModule()),
    ModuleRoute(Modular.initialRoute, module: CpfGeneratorModule()),
    ModuleRoute(Modular.initialRoute, module: TodoModule()),
    ModuleRoute(Modular.initialRoute, module: IntoxianimeModule(),),
  ];
}
