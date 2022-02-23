import 'package:flutter_modular/flutter_modular.dart';
import 'animation_exlict_button_store.dart';

import 'animation_exlict_button_page.dart';

class AnimationExplictButtonModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnimationExplictButtonStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/explictButtonPage',
        child: (_, args) => const AnimationExplictButtonPage()),
  ];
}
