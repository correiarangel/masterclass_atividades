import 'package:flutter_modular/flutter_modular.dart';
import 'package:masterclass_atividades/app/modules/mockup/mockup_module.dart';

import '../../shared/interface/check_internet_interface.dart';
import '../../shared/interface/general_version_interface.dart';
import '../../shared/util/check_internet.dart';
import '../../shared/util/general_version.dart';
import '../animations/animations_module.dart';
import '../home/home_store.dart';
import '../playground/playground_module.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IGeneralVersion>((i) => GeneralVersion()),
    Bind<ICheckInternet>((i) => CheckInternet()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ModuleRoute(Modular.initialRoute, module: PlaygroundModule()),
    ModuleRoute(Modular.initialRoute, module: AnimationsModule()),
    ModuleRoute(Modular.initialRoute, module: MockupModule()),
    
  ];
}
