import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../util/value/const_colors.dart';

part 'theme_controller.g.dart';

class ThemeController = _ThemeControllerBase with _$ThemeController;

abstract class _ThemeControllerBase with Store {
  @observable
  ThemeMode themeMain = ThemeMode.dark;

  @action
  ThemeMode toChangesTheme() {
    if (themeMain == ThemeMode.dark) {
      return themeMain = ThemeMode.light;
    } else {
      return themeMain = ThemeMode.dark;
    }
  }
    Color setColor() {
    if (themeMain == ThemeMode.dark) {
      return ConstColors.colorBackgroundLigth;
    } else {
      return ConstColors.colorBackgroundDark;
    }
  }
}
