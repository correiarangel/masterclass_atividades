// יְהֹוָה my create
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/util/value/const_colors.dart';
import '../../../../shared/util/value/const_srtring.dart';
import '../../../../shared/util/value/const_srtring_url.dart';
import '../../home_store.dart';

// ignore: must_be_immutable
class CardAbout extends StatelessWidget {
  final HomeStore homeStore;
  final ThemeController themeController;

  const CardAbout({
    required this.themeController,
    required this.homeStore,
    Key? key,
  }) : super(key: key);

  String setVersion() {
    var v = "1.0.0+10";
    if (Platform.isAndroid || Platform.isIOS) {
      v = homeStore.version ?? "1.0.0+10";
    }
    return v;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 18.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 70.0,
              child: ClipOval(
                child: Image.asset(
                  'images/dev.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              left: 18.0,
              right: 18.0,
            ),
            child: Text(
              ConstString.nameDev,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 28.0),
            child: Text(
              ConstString.aboutDev,
              style: TextStyle(
                color: ConstColors.colorDescriptionDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Observer(builder: (_) {
            return Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(width: 38.0),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: themeController.setColor(),
                    size: 32.0,
                  ),
                  onPressed: () async {
                    launch(ConstStringUrl.whatsap);
                  },
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: themeController.setColor(),
                    size: 32.0,
                  ),
                  onPressed: () async {
                    launch(ConstStringUrl.guitHub);
                  },
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: themeController.setColor(),
                    size: 32.0,
                  ),
                  onPressed: () async {},
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: themeController.setColor(),
                    size: 32.0,
                  ),
                  onPressed: () async {
                    launch(ConstStringUrl.linkdin);
                  },
                ),
                const SizedBox(width: 38.0),
              ],
            );
          }),
          const SizedBox(height: 18.0),
        ],
      ),
    );
  }
}
