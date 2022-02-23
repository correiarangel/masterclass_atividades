import 'package:flutter_modular/flutter_modular.dart';
import '../animation_exlict_button/animation_exlict_button_module.dart';
import '../animation_exlict_list/animation_exlict_list_module.dart';
import '../animation_implict_button/animation_implict_button_module.dart';
import '../animation_implict_list/animation_implict_list_module.dart';

import 'animations_page.dart';
import 'animations_store.dart';

class AnimationsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnimationsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/animationsPage', child: (_, args) => const AnimationsPage()),
    ModuleRoute(Modular.initialRoute, module: AnimationExplictButtonModule()),
    ModuleRoute(Modular.initialRoute, module: AnimationExlictListModule()),
    ModuleRoute(Modular.initialRoute, module: AnimationImplictButtonModule()),
    ModuleRoute(Modular.initialRoute, module: AnimationImplictListModule()),
  ];
}
