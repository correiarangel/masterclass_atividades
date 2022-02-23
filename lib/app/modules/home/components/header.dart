import 'package:flutter/material.dart';
import '../../../shared/controllers/theme_controller.dart';

import '../home_store.dart';
import 'row_header.dart';

class Header extends StatelessWidget {
  final String titulo;
  final BuildContext context;
  final String screen;
  final ThemeController themeController;
  final HomeStore controller;
  const Header({
    Key? key,
    required this.titulo,
    required this.context,
    required this.screen,
    required this.themeController,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 32.0),
      decoration: const BoxDecoration(),
      child: Column(
        children: <Widget>[
          RowHeader(
            homeStore: controller,
            widthSized: MediaQuery.of(context).size.width / 5,
            themeController: themeController,
            pathImg: "images/logo/logo.png",
            widthImg: 48.0,
            heightImg: 48.0,
            fontSize1: 28.0,
            fontSize2: 16.0,
          ),
        ],
      ),
    );
  }
}
