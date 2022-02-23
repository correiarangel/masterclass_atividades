import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/controllers/theme_controller.dart';


import 'shared/util/value/thema_white.dart';

import 'shared/util/value/theme_dark.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final themeController = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        themeMode: themeController.themeMain,
        theme: ThemaWhite.theme,
        darkTheme: ThemeDark.theme,
        debugShowCheckedModeBanner: false,
        title: 'Masterclass Atividades',
      );
    });
  }
}
