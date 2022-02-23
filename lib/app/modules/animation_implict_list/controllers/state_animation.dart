import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class StateAnimation extends ChangeNotifier {
  bool isRotation = false;
  double angle = 0.2;
  Color color = ConstColors.colorPrimary;

  void rotation() {
    if (isRotation == true) {
      angle -= 0.2;
      color = ConstColors.colorDescriptionDark;
    } else {
      color = ConstColors.colorPrimary;
      angle += 0.2;
    }
    notifyListeners();
  }

  void testRotation() {
    if (isRotation == true) {
      isRotation = false;
    } else {
      isRotation = true;
    }
    notifyListeners();
  }
}
