import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colorsII.dart';


class DialogCustom extends StatelessWidget {
  final String title;
  final String description;
  final double top;
  final double bottom;
  final double right;
  final double left;
  final double radius;

  // ignore: use_key_in_widget_constructors
  const DialogCustom({
    required this.title,
    required this.description,
    required this.top,
    required this.bottom,
    required this.right,
    required this.left,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Column(
        children: <Widget>[
         const SizedBox(height: 150.0,),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(
                top: top,
                bottom: bottom,
                left: left,
                right: right,
              ),
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: ConstColorsII.colorMajorelleBlue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: const [
                  BoxShadow(
                    color: ConstColorsII.colorStateGray,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 34.0,
                       color: ConstColorsII.colorWhite,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ConstColorsII.colorWhite,
                      fontSize: 21.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: const Text(
                        'Entendi',
                        style: TextStyle(
                          fontSize: 18.0,
                           color: ConstColorsII.colorWhite,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
