import 'package:flutter_modular/flutter_modular.dart';

import 'mockup_page.dart';
import 'mockup_store.dart';

class MockupModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MockupStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mockupPage',
      child: (_, args) => const MockupPage(),
    ),
  ];
}
