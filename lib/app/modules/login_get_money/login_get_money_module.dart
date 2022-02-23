import 'package:flutter_modular/flutter_modular.dart';

import 'login_get_money_page.dart';
import 'login_get_money_store.dart';

class LoginGetMoneyModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginGetMoneyStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    //ChildRoute('/', child: (_, args) => LoginGetMoneyPage()),
    ChildRoute('/loginGetMoneyPage',
        child: (_, args) => const LoginGetMoneyPage()),
  ];
}
