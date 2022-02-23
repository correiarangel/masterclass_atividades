import 'package:flutter_modular/flutter_modular.dart';

import 'login_tinder_page.dart';
import 'login_tinder_store.dart';

class LoginTinderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginTinderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/loginTinderPage', child: (_, args) => const LoginTinderPage()),
  ];
}
