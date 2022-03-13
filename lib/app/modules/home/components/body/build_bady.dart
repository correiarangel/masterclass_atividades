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

  // ignore: body_might_complete_normally_nullable
  Widget? returnBody({required currentIndex}) {
    if (currentIndex == 0) {
      return BodyAtividades(
        themeController: themeController,
      );
    } else if (currentIndex == 1) {
      return BodyGuitHub(
        themeController: themeController,
      );
    } else if (currentIndex == 2) {
      return BodyAboutDev(
        themeController: themeController,
        homeStore: controller,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        var _currentIndex = controller.currentIndex;
        return returnBody(currentIndex: _currentIndex)!;
      },
    );
  }
}
