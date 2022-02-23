import 'package:flutter/material.dart';

import '../../../shared/util/value/const_colors.dart';

class WidGetController {
  final Widget circularProgress = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      SizedBox(height: 48.0),
      CircularProgressIndicator(
        backgroundColor: ConstColors.colorHighLight,
      ),
    ],
  );
}
