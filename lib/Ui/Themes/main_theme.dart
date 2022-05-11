import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';

//Themes
ThemeData primaryTheme = ThemeData(
  primaryColor: primaryColor,
  errorColor: errorColor,
  backgroundColor: surfaceColor,
  scaffoldBackgroundColor: backgroundColor,
  hintColor: hintColor,
  shadowColor: darkColor,
  cardColor: backgroundColor,
  dividerColor: notSetYet,

  //Icons
  iconTheme: const IconThemeData(color: primaryColor),

  //appBar
  appBarTheme: AppBarTheme(
    backgroundColor: surfaceColor,
    centerTitle: true,
    elevation: 0,
  ),

  //colors
  colorScheme: ColorScheme(
      primary: primaryColor,
      primaryVariant: notSetYet,
      secondary: notSetYet,
      secondaryVariant: notSetYet,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: onPrimary,
      onSecondary: notSetYet,
      onSurface: darkColor,
      onBackground: darkColor,
      onError: notSetYet,
      brightness: Brightness.light),

  // fonts
  fontFamily: 'Roboto',

  //text style
  textTheme: TextTheme(
    headline1: const TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: darkColor),
    headline2: const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: darkColor),
    headline3: const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: darkColor),
    subtitle1: const TextStyle(fontSize: 18.0, color: darkColor),
    subtitle2: const TextStyle(fontSize: 14.0, color: primaryColor),
    bodyText1: TextStyle(fontSize: 14.0, color: surfaceColor),
    bodyText2: const TextStyle(fontSize: 14.0, color: darkColor),
    button: TextStyle(fontSize: 14.0, color: surfaceColor),
  ),

  //button
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(backgroundColor),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 14.0, color: primaryColor)),
  )),
);
