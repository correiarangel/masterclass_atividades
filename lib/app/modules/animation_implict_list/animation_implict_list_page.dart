import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/util/value/const_colors.dart';

import 'components/listview_implicit.dart';
import 'controllers/animation_implict_list_store.dart';

class AnimationImplictListPage extends StatefulWidget {
  const AnimationImplictListPage({Key? key}) : super(key: key);
  @override
  AnimationImplictListPageState createState() =>
      AnimationImplictListPageState();
}

class AnimationImplictListPageState extends State<AnimationImplictListPage> {
  final AnimationImplictListStore store = Modular.get();
  final ThemeController themeController = Modular.get();

  Color setColor() {
    if (themeController.themeMain == ThemeMode.dark) {
      return ConstColors.colorBackgroundLigth;
    } else {
      return ConstColors.colorBackgroundDark;
    }
  }

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
                  color: setColor(),
                ),
                onPressed: () async {
                  themeController.toChangesTheme();
                },
              );
            },
          )
        ],
        title: const Text(
          'List Animation Implict',
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
              return ListViewImplicit(
                heroiModels: heroiModels,
              );
            },
          ),
        ],
      ),
    );
  }
}
