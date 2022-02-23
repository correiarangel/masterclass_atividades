import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_srtring_url.dart';
import '../../shared/controllers/theme_controller.dart';

import 'components/card_mockup.dart';
import 'mockup_store.dart';

class MockupPage extends StatefulWidget {
  const MockupPage({Key? key}) : super(key: key);
  @override
  MockupPageState createState() => MockupPageState();
}

class MockupPageState extends State<MockupPage> {
  final MockupStore store = Modular.get();
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
          'Mockups',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CardMockup(
              number: '1',
              url: ConstStringUrl.mockupI,
              text: 'Exercício 01',
              themeController: themeController,
            ),
            CardMockup(
              number: '2',
              url: ConstStringUrl.mockupII,
              text: 'Exercício 01',
              themeController: themeController,
            ),
          ],
        ),
      ),
    );
  }
}
