import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/modules/home/components/about_skills.dart';
import '../card/card_about.dart';
import '../../home_store.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../about_favorits.dart';

class BodyAboutDev extends StatelessWidget {
  final ThemeController themeController;
  final HomeStore homeStore;

  const BodyAboutDev({
    Key? key,
    required this.themeController,
    required this.homeStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CardAbout(
          homeStore: homeStore,
          themeController: themeController,
        ),
        AboutFavorits(
          homeStore: homeStore,
        ),
        AboutSkills(
          themeController: themeController,
          homeStore: homeStore,
        )
      ],
    );
  }
}
