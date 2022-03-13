import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/util/value/const_colors.dart';

class CardCustom extends StatelessWidget {
  final ThemeController themaController;
  final String imgHeaderPath;
  final String textHeader;
  final String textHeaderII;
  final String qtExercicios;
  final String textButton;
  final String textLink;
  final String urlLink;
  final String description;
  final String route;
  const CardCustom({
    Key? key,
    required this.themaController,
    required this.imgHeaderPath,
    required this.textHeader,
    required this.textHeaderII,
    required this.qtExercicios,
    required this.textButton,
    required this.textLink,
    required this.description,
    required this.urlLink,
    required this.route,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: //Colunm Pai
          Column(
        children: [
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            direction: Axis.horizontal,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Observer(
                        builder: (context) {
                          return CircleAvatar(
                            backgroundColor: ConstColors.colorPrimary,
                            child: Image.asset(
                              imgHeaderPath,
                              color: themaController.themeMain == ThemeMode.dark
                                  ? ConstColors.colorBackgroundDark
                                  : ConstColors.colorBackgroundLigth,
                              height: 32,
                              width: 32,
                            ),
                          );
                        },
                      )),
                  Text(
                    textHeader,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textHeaderII,
                      style: const TextStyle(
                        color: ConstColors.colorDescriptionDark,
                      ),
                    ),
                  ),
                  Text(qtExercicios),
                  const SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              description,
              style: const TextStyle(
                color: ConstColors.colorDescriptionDark,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              direction: Axis.horizontal,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const FaIcon(
                      FontAwesomeIcons.github,
                    ),
                    const SizedBox(width: 12.0),
                    GestureDetector(
                      child: Text(
                        textLink,
                      ),
                      onTap: () async {
                        urlLink;
                        if (urlLink.isNotEmpty) await launch(urlLink);
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed(route);
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text(textButton) //'Ver mais'),
                      ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
