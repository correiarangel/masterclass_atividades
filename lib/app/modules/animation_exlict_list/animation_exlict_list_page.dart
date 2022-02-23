import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterclass_atividades/app/modules/animation_exlict_button/animation_exlict_button_page.dart';
import 'package:masterclass_atividades/app/modules/animation_exlict_button/animation_exlict_button_store.dart';
import 'package:masterclass_atividades/app/modules/animation_exlict_button/components/button_animat_explict.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colors.dart';
import '../../shared/controllers/theme_controller.dart';
import 'animation_exlict_list_store.dart';
import 'package:flutter/material.dart';

import 'components/listview_explict.dart';

class AnimationExpictListPage extends StatefulWidget {
  const AnimationExpictListPage({Key? key}) : super(key: key);
  @override
  AnimationExplictListPageState createState() =>
      AnimationExplictListPageState();
}

class AnimationExplictListPageState extends State<AnimationExpictListPage> {
  final AnimationExplictListStore store = Modular.get();
  final ThemeController themeController = Modular.get();
    @override
  void initState() {
    store.fillHeroiModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 42.0,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Observer(
            builder: (context) {
              return IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.moon,
                  color: themeController.setColor(),
                ),
                onPressed: () async {
                  themeController.toChangesTheme();
                },
              );
            },
          )
        ],
        title: const Text(
          'List Animation Explict',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (context) {
              var heroiModels = store.heroiModels;
              return ListViewExplicit(
                heroiModels: heroiModels,
              );
            },
          ),
        ],
      ),
    );
  }
}
