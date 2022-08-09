import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.all(4),
        thumbColor: MaterialStateProperty.all(Colors.black54),
        trackBorderColor: MaterialStateProperty.all(Colors.red),
        trackColor: MaterialStateProperty.all(Colors.red),
        mainAxisMargin: 10,
        showTrackOnHover: true,
        radius: Radius.circular(20),
        minThumbLength: 1),
    scaffoldBackgroundColor: Colors.grey[200],
    // primaryColor: Colors.blue,
    accentColor: Colors.black,
    buttonColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.grey[200],

    appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Color.fromRGBO(197, 48, 48, 10),
        // color: Color.fromRGBO(101, 126, 209, 1.0),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 25),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      button: TextStyle(
          fontFamily: 'QuickSand',
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w200),
      bodyText2: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      headline1: TextStyle(
          color: Colors.black, fontSize: 23, fontWeight: FontWeight.w900),
      headline2: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
          color: Colors.black,
          fontFamily: 'OpenSans',
          fontSize: 14,
          fontWeight: FontWeight.w700),
      headline3: TextStyle(
          // letterSpacing: 1,
          // wordSpacing: 1,
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'QuickSand',
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          // letterSpacing: 1.4,
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      headline5: TextStyle(
          // letterSpacing: 1.4,
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600),
      headline6: TextStyle(
          // letterSpacing: 1.4,
          fontFamily: 'QuickSand',
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600),
      subtitle1: TextStyle(
          fontFamily: 'QuickSand',
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      subtitle2: TextStyle(
          color: Colors.red,
          fontFamily: 'OpenSans',
          fontSize: 15,
          fontWeight: FontWeight.bold),
    ),
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.all(4),
        thumbColor: MaterialStateProperty.all(Colors.grey[200]),
        trackBorderColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.all(Colors.red),
        mainAxisMargin: 10,
        showTrackOnHover: true,
        radius: Radius.circular(20),
        minThumbLength: 1),
    scaffoldBackgroundColor: Color.fromRGBO(20, 20, 20, 100),
    // primaryColor: Colors.blue,
    cardColor: Colors.black,

    accentColor: Colors.white,
    buttonColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Color.fromRGBO(197, 48, 48, 10),
        // color: Color.fromRGBO(101, 126, 209, 1.0),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      bodyText2: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
      button: TextStyle(
          fontFamily: 'QuickSand',
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w200),
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      headline1: TextStyle(
          color: Colors.grey[200], fontSize: 23, fontWeight: FontWeight.w900),
      headline2: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
          color: Colors.white,
          fontFamily: 'OpenSans',
          fontSize: 14,
          fontWeight: FontWeight.w500),
      headline3: TextStyle(
          // letterSpacing: 1,
          // wordSpacing: 1,
          color: Colors.grey[200],
          fontSize: 16,
          fontFamily: 'QuickSand',
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          // letterSpacing: 1.4,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      headline5: TextStyle(
          // letterSpacing: 1.4,
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600),
      subtitle1: TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.white54,
          fontSize: 12,
          fontWeight: FontWeight.w100),
      subtitle2: TextStyle(
          color: Colors.red, fontSize: 12, fontWeight: FontWeight.w300),
    ),
  );
}
