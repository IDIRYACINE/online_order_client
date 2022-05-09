import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(
  primaryColor: Colors.orange,
  errorColor: Colors.red,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.grey[200],
  secondaryHeaderColor: Colors.white,
  hintColor: Colors.grey[200],
  shadowColor: Colors.black,
  cardColor: Colors.white,
  dividerColor: Colors.grey[300],
  // font
  fontFamily: 'Georgia',
  //text style
  textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      subtitle1: TextStyle(fontSize: 14.0, color: Colors.grey),
      bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.black)),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14.0, color: Colors.white)),
          shape: MaterialStateProperty.all(const StadiumBorder()),
          minimumSize: MaterialStateProperty.all(const Size(200.0, 100.0)))),
);
