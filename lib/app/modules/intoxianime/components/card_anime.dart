import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/util/value/const_colors.dart';

class CardAnime extends StatelessWidget {
  final ThemeController themeController;
  final String number;
  final String link;
  final String title;
  final String guidUrl;
  const CardAnime({
    Key? key,
    required this.number,
    required this.link,
    required this.guidUrl,
    required this.title,
    required this.themeController,
  }) : super(key: key);

  setUrl({required url}) async => await launch(url);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 12.0,
        right: 18.0,
        top: 18.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircleAvatar(
              backgroundColor: ConstColors.colorPrimary,
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: ConstColors.colorCardLight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [

            GestureDetector(
              onTap: () async {
                 await launch(link);
              },
              child: const Text('Acessar link'),),
              GestureDetector(
              onTap: () async {
                await launch(guidUrl);
              },
              child: const Text('Acessar Guid'),),
          ],)
        ],
      ),
    );
  }
}
