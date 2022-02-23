import 'package:flutter/material.dart';
import 'const_colors.dart';

class ThemeDark {
  ///acthor:
  static ThemeData get theme => ThemeData.dark().copyWith(
        primaryColor: ConstColors.colorPrimary,
        highlightColor: ConstColors.colorHighLightDark,
        cardTheme: const CardTheme(
          color: ConstColors.colorCardDark,
        ),
        backgroundColor: ConstColors.colorBackgroundDark,
        scaffoldBackgroundColor: ConstColors.colorBackgroundDark,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          actionsIconTheme: IconThemeData(
            color: ConstColors.colorBackgroundDark,
          ),
          iconTheme: IconThemeData(
            color: ConstColors.colorBackgroundLigth,
          ),
          backgroundColor: ConstColors.colorBackgroundDark,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: ConstColors.colorHighLightDark,
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ConstColors.colorHighLightDark,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ConstColors.colorDescriptionDark,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ConstColors.colorHighLightDark,
          ),
          caption: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: ConstColors.colorHighLightDark,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ConstColors.colorHighLightDark,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ConstColors.colorHighLight,
          ),
        ),
      
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: ConstColors.colorDescriptionDark,
          selectedItemColor: ConstColors.colorHighLightDark,
          backgroundColor: ConstColors.colorBackgroundDark,
        ),
        iconTheme: const IconThemeData(
          color: ConstColors.colorBackgroundLigth,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ConstColors.colorPrimary,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: ConstColors.colorBackgroundLigth,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: ConstColors.colorCardLight,
        ),
        // ignore: prefer_const_constructors
        listTileTheme: ListTileThemeData(
          textColor: ConstColors.colorCardLight,
        ),
        
      );
}
