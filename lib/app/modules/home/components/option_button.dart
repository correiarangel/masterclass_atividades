import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class OptionsButton extends StatelessWidget {
  final IconData btnicon;
  final Color iconcor;
  final Color btncor;
  final Color corText;
  final double textSize;
  final String text;
  final double top;
  final double rigth;
  final double left;
  final VoidCallback callback;

    // ignore: use_key_in_widget_constructors
    const OptionsButton({
    required this.btnicon,
    required this.iconcor,
    required this.btncor,
    required this.corText,
    required this.textSize,
    required this.text,
    required this.top,
    required this.rigth,
    required this.left,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: rigth,
      ),
      child: ElevatedButton.icon(
        icon: Icon(
          btnicon,
          color: iconcor,
          size: 28.0,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: corText,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          elevation: MaterialStateProperty.all(9.0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.fromLTRB(30, 30, 30, 30),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: ConstColors.colorBackgroundDark),
          ),
        ),
        onPressed: callback,
      ),
    );
  }
}
