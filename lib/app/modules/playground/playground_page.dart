import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/controllers/card_exercicio.dart';

import '../../shared/controllers/theme_controller.dart';

import 'playground_store.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({Key? key}) : super(key: key);
  @override
  PlaygroundPageState createState() => PlaygroundPageState();
}

class PlaygroundPageState extends State<PlaygroundPage> {
  final PlaygroundStore store = Modular.get();
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
          'PlayGraund Flutter',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: [
          CardExercicio(
            number: '1',
            rote: '/loginGetMoneyPage',
            text: 'Login Get Money Ex.01',
            themeController: themeController,
          ),
          CardExercicio(
            number: '2',
            rote: '/loginTinderPage',
            text: 'Login Tinder Ex.01',
            themeController: themeController,
          ),
          CardExercicio(
            number: '3',
            rote: '/generatCpfPage',
            text: 'Gerador Validador CPF Ex.03',
            themeController: themeController,
          ),
          CardExercicio(
            number: '4',
            rote: '/todoPage',
            text: 'Todos (Serve Dartion) Ex.04',
            themeController: themeController,
          ),
          CardExercicio(
            number: '5',
            rote: '/intoxiPage',
            text: 'Lista infinita c/ Bloc Ex.05',
            themeController: themeController,
          ),
          const SizedBox(height: 28.0),
        ],
      ),
    );
  }
}
