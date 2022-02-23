import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/state_animation.dart';

import 'animation_implict_list_page.dart';
import 'controllers/animation_implict_list_store.dart';

class AnimationImplictListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnimationImplictListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/implictListPage',
      child: (_, args) => const AnimationImplictListPage(),
    ),
  ];
}
