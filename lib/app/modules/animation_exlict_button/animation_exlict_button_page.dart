import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterclass_atividades/app/shared/controllers/theme_controller.dart';
import '../../shared/util/value/const_colors.dart';

import 'animation_exlict_button_store.dart';
import 'components/button_animat_explict.dart';

class AnimationExplictButtonPage extends StatefulWidget {
  final String title;
  const AnimationExplictButtonPage(
      {Key? key, this.title = 'AnimationExlictButtonPage'})
      : super(key: key);
  @override
  AnimationExplictButtonPageState createState() =>
      AnimationExplictButtonPageState();
}

class AnimationExplictButtonPageState
    extends State<AnimationExplictButtonPage> {

  final AnimationExplictButtonStore store = Modular.get();
 final ThemeController themeController = Modular.get();
  // ignore: unused_field
  final _duration = const Duration(seconds: 3);
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
        title: const Text('Button Animation Explict'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ButtonAnimatExplict(
          store: store,
          colorButton: ConstColors.colorPrimary,
        ),
      ),
    );
  }
}
