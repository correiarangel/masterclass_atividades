import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/controllers/card_exercicio.dart';

import '../../shared/controllers/theme_controller.dart';
import '../../shared/util/value/const_colors.dart';

import 'animations_store.dart';


class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);
  @override
  AnimationsPageState createState() => AnimationsPageState();
}

class AnimationsPageState extends State<AnimationsPage> {
  final AnimationsStore store = Modular.get();
  final ThemeController themeController = Modular.get();
  Color setColor() {
    if (themeController.themeMain == ThemeMode.dark) {
      return ConstColors.colorBackgroundLigth;
    } else {
      return ConstColors.colorBackgroundDark;
    }
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
        actions: <Widget>[
          Observer(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Animações,',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: setColor(),
                    ),
                  ),
                  Text(
                    'Flutterando Masterclass',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: setColor(),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 120.0),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CardExercicio(
              number: '1',
              rote: '/implictButtonPage',
              text: 'Button Implict Ex.01',
              themeController: themeController,
            ),
            CardExercicio(
              number: '2',
              rote: '/implictListPage',
              text: 'List Implict Ex. 02',
              themeController: themeController,
            ),
            CardExercicio(
              number: '3',
              rote: '/explictButtonPage',
              text: 'Button Explict Ex.03',
              themeController: themeController,
            ),
            CardExercicio(
              number: '4',
              rote: '/explictListPage',
              text: 'List Explict Ex.03',
              themeController: themeController,
            ),
          ],
        ),
      ),
    );
  }
}
