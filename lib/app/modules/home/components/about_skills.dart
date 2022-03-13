// יְהֹוָה my create

import 'package:flutter/material.dart';
import 'card/card_skills.dart';
import '../../../shared/controllers/theme_controller.dart';

import '../home_store.dart';

// ignore: must_be_immutable
class AboutSkills extends StatelessWidget {
  final HomeStore homeStore;
  final ThemeController themeController;

  const AboutSkills({
    required this.themeController,
    required this.homeStore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text('Habilidade e Competência'),
          ),
        ),
        const SizedBox(height: 8.0),
        CardASkills(
          themeController: themeController,
          homeStore: homeStore,
        )
      ],
    );
  }
}
