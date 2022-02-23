import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/util/value/const_srtring.dart';
import 'card_custom.dart';

class BodyAtividades extends StatelessWidget {
  final ThemeController themeController;
  const BodyAtividades({
    required this.themeController,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 28.0),
          CardCustom(
            themaController: themeController,
            imgHeaderPath: 'images/running.png',
            textHeader: 'Atividades',
            textHeaderII: 'Exercicios:',
            qtExercicios: '4',
            textButton: 'Ver mais',
            textLink: 'Acessar código fonte',
            description: ConstString.descriptionI,
            urlLink: 'www.goole.com.br',
            route: '/animationsPage',
          ),
          const SizedBox(height: 28.0),
          CardCustom(
            themaController: themeController,
            imgHeaderPath: 'images/glasses.png',
            textHeader: 'Leitura de Mockup',
            textHeaderII: 'Exercicios:',
            qtExercicios: '2',
            textButton: 'Ver mais',
            textLink: 'Acessar código fonte',
            description: ConstString.descriptionMockup,
            urlLink: '',
            route:'/mockupPage',
          ),
          const SizedBox(height: 28.0),
          CardCustom(
            themaController: themeController,
            imgHeaderPath: 'images/toys.png',
            textHeader: 'Playground',
            textHeaderII: 'Exercicios:',
            qtExercicios: '4',
            textButton: 'Ver mais',
            textLink: 'Acessar código fonte',
            description: ConstString.descriptionPlayg,
            urlLink: 'www.goole.com.br',
            route: '/playgroundPage',
          ),
          const SizedBox(height: 28.0),
        ],
      ),
    );
  }
}
