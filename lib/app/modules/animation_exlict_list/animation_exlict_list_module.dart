import 'animation_exlict_list_page.dart';
import 'animation_exlict_list_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimationExlictListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnimationExplictListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/explictListPage',
      child: (_, args) => const AnimationExpictListPage(),
    ),
  ];
}
