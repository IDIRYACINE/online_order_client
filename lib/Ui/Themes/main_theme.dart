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
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[200]),
  colorScheme: ColorScheme(
      primary: Colors.orange,
      primaryVariant: Colors.white,
      secondary: Colors.white,
      secondaryVariant: Colors.white,
      surface: Colors.white,
      background: Colors.grey[200]!,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light),
  // font
  fontFamily: 'Georgia',
  //text style
  textTheme: TextTheme(
    headline1: const TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    subtitle1: const TextStyle(fontSize: 18.0, color: Colors.grey),
    bodyText1: TextStyle(fontSize: 14.0, color: Colors.grey[200]),
    bodyText2: const TextStyle(fontSize: 14.0, color: Colors.black),
    button: const TextStyle(fontSize: 14.0, color: Colors.white),
  ),

  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14.0, color: Colors.white)),
          shape: MaterialStateProperty.all(const StadiumBorder()),
          minimumSize: MaterialStateProperty.all(const Size(200.0, 100.0)))),
);
