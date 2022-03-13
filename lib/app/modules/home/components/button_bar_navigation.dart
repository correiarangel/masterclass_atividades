import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_store.dart';

class ButtonBarNavigation extends StatelessWidget {
  final HomeStore controller;
  final ScrollController scrollController;
  const ButtonBarNavigation({
    Key? key,
    required this.controller,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: controller.toChangesPage,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bullseye),
              // ignore: deprecated_member_use
              label: "Atividades",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.github,
              ),
              // ignore: deprecated_member_use
              label: "GuitHub",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.userAlt,
              ),
              // ignore: deprecated_member_use
              label: "Sobre Dev",
            ),
          ],
        );
      },
    );
  }
}
