import 'package:flutter_modular/flutter_modular.dart';
import 'package:masterclass_atividades/app/page/splash_page.dart';
import 'package:masterclass_atividades/app/shared/interface/check_internet_interface.dart';
import 'package:masterclass_atividades/app/shared/util/check_internet.dart';
import 'shared/controllers/theme_controller.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    
    Bind((i) => ThemeController()),
    Bind<ICheckInternet>((i)=>CheckInternet()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
