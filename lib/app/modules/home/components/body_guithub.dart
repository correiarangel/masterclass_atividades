import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';

import '../../../shared/controllers/theme_controller.dart';
import 'card_repository.dart';

class BodyGuitHub extends StatelessWidget {
  final ThemeController themeController;
  const BodyGuitHub({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CardRepository(
            number: '1',
            text: 'Repositórios 01',
            themeController: themeController,
            url: ConstStringUrl.repositories,
          ),
        ],
      ),
    );
  }
}
