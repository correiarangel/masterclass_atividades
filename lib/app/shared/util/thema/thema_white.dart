import 'package:flutter/material.dart';
import '../value/const_colors.dart';




class ThemaWhite {
  static  ThemeData get theme => ThemeData(
      primaryColor: ConstColors.colorPrimary,
      backgroundColor: ConstColors.colorBackgroundLigth,
      scaffoldBackgroundColor: ConstColors.colorBackgroundLigth,
      cardTheme: const CardTheme(
        color: ConstColors.colorCardLight,
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: ConstColors.colorBackgroundDark,
        ),
        centerTitle: false,
        actionsIconTheme: IconThemeData(
          color: ConstColors.colorBackgroundDark,
        ),
        iconTheme: IconThemeData(
          color: ConstColors.colorBackgroundDark,
        ),
        backgroundColor: ConstColors.colorBackgroundLigth,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ConstColors.colorBackgroundDark,
        ),
        
        headline2: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ConstColors.colorBackgroundDark,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ConstColors.colorBackgroundDark,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ConstColors.colorBackgroundDark,
        ),
        caption: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ConstColors.colorBackgroundDark,
        ),
        subtitle1: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ConstColors.colorBackgroundDark,
        ),
        subtitle2: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ConstColors.colorBackgroundDark,
        ),

      ),
      primaryIconTheme: const IconThemeData(
        color: ConstColors.colorBackgroundLigth,
      ),
      iconTheme: const IconThemeData(
        color: ConstColors.colorBackgroundDark,
      ),
      bottomAppBarColor: ConstColors.colorBackgroundLigth,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: ConstColors.colorDescriptionDark,
        selectedItemColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: ConstColors.colorPrimary,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: ConstColors.colorCardLight,
      ),
      listTileTheme: const ListTileThemeData(
        textColor: ConstColors.colorCardDark,
      ));
}
