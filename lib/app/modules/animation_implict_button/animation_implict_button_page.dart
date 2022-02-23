import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterclass_atividades/app/shared/controllers/theme_controller.dart';
import '../../shared/util/value/const_colors.dart';
import 'package:flutter/material.dart';

import 'animation_implict_button_store.dart';

class AnimationImplictButtonPage extends StatefulWidget {
  const AnimationImplictButtonPage({Key? key}) : super(key: key);
  @override
  AnimationImplictButtonPageState createState() =>
      AnimationImplictButtonPageState();
}

class AnimationImplictButtonPageState
    extends State<AnimationImplictButtonPage> {
  final AnimationImplictButtonStore store = Modular.get();

  final _duration = const Duration(seconds: 3);
  final ThemeController themeController = Modular.get();

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
          'Button Animation Implict',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Observer(
          builder: (context) {
            return AnimatedAlign(
              alignment: store.isAnimatioRun
                  ? Alignment.topCenter
                  : Alignment.bottomRight,
              duration: _duration,
              child: GestureDetector(
                child: AnimatedContainer(
                  width: store.isAnimatioRun ? 250 : 50,
                  height: 50,
                  duration: _duration,
                  decoration: BoxDecoration(
                    borderRadius: store.isAnimatioRun
                        ? BorderRadius.circular(8)
                        : BorderRadius.circular(45),
                    color: ConstColors.colorPrimary,
                  ),
                ),
                onTap: () => store.toChangesIsloading(),
              ),
            );
          },
        ),
      ),
    );
  }
}
