import 'package:flutter_modular/flutter_modular.dart';

import 'animation_implict_button_page.dart';
import 'animation_implict_button_store.dart';

class AnimationImplictButtonModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnimationImplictButtonStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/implictButtonPage',
        child: (_, args) => const AnimationImplictButtonPage()),
  ];
}
