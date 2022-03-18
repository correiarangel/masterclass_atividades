import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/controllers/theme_controller.dart';

import '../../home_store.dart';
import 'body_atividades.dart';
import 'body_guithub.dart';
import 'body_about_dev.dart';

class BuildBody extends StatelessWidget {
  final ThemeController themeController;
  final HomeStore controller;

  const BuildBody({
    Key? key,
    required this.controller,
    required this.themeController,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Widget _bodyWidget = const SizedBox.shrink();
    return Observer(
      builder: (context) {
        var _currentIndex = controller.currentIndex;
        if (_currentIndex == 0) {
          return _bodyWidget = BodyAtividades(
            themeController: themeController,
          );
        } else if (_currentIndex == 1) {
          return _bodyWidget = BodyGuitHub(
            themeController: themeController,
          );
        } else if (_currentIndex == 2) {
          return _bodyWidget = BodyAboutDev(
            themeController: themeController,
            homeStore: controller,
          );
        }
        return _bodyWidget;
      },
    );
  }
}
