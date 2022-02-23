import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterclass_atividades/app/modules/home/home_store.dart';
import '../../../shared/controllers/theme_controller.dart';

import '../../../shared/util/value/const_colors.dart';

class RowHeader extends StatelessWidget {
  final String pathImg;
  final HomeStore homeStore;
  final double widthImg;
  final double heightImg;
  final double fontSize1;
  final double fontSize2;
  final ThemeController themeController;
  final double widthSized;

  const RowHeader({
    required this.widthSized,
    required this.pathImg,
    required this.widthImg,
    required this.heightImg,
    required this.fontSize1,
    required this.fontSize2,
    required this.themeController,
    required this.homeStore,
    Key? key,
  }) : super(key: key);

  Color get colorMain {
    if (themeController.themeMain == ThemeMode.dark) {
      return ConstColors.colorBackgroundLigth;
    } else {
      return ConstColors.colorBackgroundDark;
    }
  }

  String gettitle({required int currentIndex}) {
    String title = 'Atividades';
    if (currentIndex == 0) {
      title = 'Atividades';
    } else if (currentIndex == 1) {
      title = 'Repositorios';
    } else if (currentIndex == 2) {
      title = 'Sobre o Dev.';
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    //Colunm Pai
    return Flex(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 12.0),
            Image.asset(
              pathImg,
              width: widthImg,
              height: heightImg,
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                  builder: (context) {
                    int currentIndex = homeStore.currentIndex;
                    return Text(
                      gettitle(currentIndex: currentIndex),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: colorMain,
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (context) {
                    return Text(
                      'Flutterando Masterclass',
                      style: TextStyle(
                        fontSize: fontSize2,
                        fontWeight: FontWeight.w500,
                        color: colorMain,
                      ),
                      textAlign: TextAlign.start,
                    );
                  },
                )
              ],
            ),
          ],
        ),
        SizedBox(width: widthSized),
        Observer(
          builder: (context) {
            return TextButton.icon(
              onPressed: () {
                themeController.toChangesTheme();
              },
              icon: FaIcon(
                FontAwesomeIcons.moon,
                color: colorMain,
              ),
              label: const Text(''),
            );
          },
        )
      ],
    );
  }
}

/*

 */
