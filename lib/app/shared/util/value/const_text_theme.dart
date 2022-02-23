import 'package:flutter/material.dart';

class ConstTextThme {
  static  get textThemMain => const TextTheme(
    headline1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    ),
    headline2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
    ),
    bodyText2: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
    ),
  );
}
