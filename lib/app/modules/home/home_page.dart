import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/controllers/theme_controller.dart';
import 'components/build_bady.dart';
import 'components/button_bar_navigation.dart';

import 'components/row_header.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final themaController = Modular.get<ThemeController>();
  ScrollController scrollController = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RowHeader(
            widthSized: MediaQuery.of(context).size.width / 5,
            themeController: themaController,
            pathImg: "images/logo/logo.png",
            widthImg: 48.0,
            heightImg: 48.0,
            fontSize1: 28.0,
            fontSize2: 16.0,
            homeStore: controller,
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: BuildBody(
          controller: controller,
          themeController: themaController,
        ),
      ),
      bottomNavigationBar: ButtonBarNavigation(
        scrollController: scrollController,
        controller: controller,
      ),
    );
  }
}
