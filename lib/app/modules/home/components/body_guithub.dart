import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/util/value/const_srtring_url.dart';
import 'card_repository.dart';

class BodyGuitHub extends StatelessWidget {
  final ThemeController themeController;
  const BodyGuitHub({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CardRepository(
          number: '1',
          text: 'correiarangel,main page 01',
          themeController: themeController,
          url: ConstStringUrl.guitHub,
        ),
        CardRepository(
          number: '2',
          text: 'Repositórios 31',
          themeController: themeController,
          url: ConstStringUrl.repositories,
        ),
      ],
    );
  }
}
