import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/util/value/const_colors.dart';

class CardRepository extends StatelessWidget {
  final ThemeController themeController;
  final String number;
  final String url;
  final String text;
  const CardRepository({
    Key? key,
    required this.number,
    required this.url,
    required this.text,
    required this.themeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
       await launch(url);
      },
      child: Card(
        margin: const EdgeInsets.only(
          left: 12.0,
          right: 18.0,
          top: 18.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                text,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
