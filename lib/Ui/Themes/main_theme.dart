import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';

//Themes
ThemeData primaryTheme = ThemeData(
  primaryColor: primaryColor,
  errorColor: errorColor,
  backgroundColor: backgroundColor,
  scaffoldBackgroundColor: surfaceColor,
  hintColor: hintColor,
  shadowColor: darkColor,
  cardColor: surfaceColor,
  dividerColor: dividerColor,

  //Icons
  iconTheme: const IconThemeData(color: primaryColor, size: iconSizeDefault),

  //appBar
  appBarTheme: const AppBarTheme(
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
        fontSize: textSizeLarge, fontWeight: FontWeight.bold, color: darkColor),
    headline2: const TextStyle(
        fontSize: textSizeMeduim,
        fontWeight: FontWeight.bold,
        color: darkColor),
    headline3: const TextStyle(
        fontSize: textSizeMeduim,
        fontWeight: FontWeight.bold,
        color: darkColor),
    subtitle1: const TextStyle(fontSize: textSizeMeduim, color: darkColor),
    subtitle2: TextStyle(fontSize: textSizeMeduim2, color: hintColor),
    bodyText1: const TextStyle(fontSize: textSizeMeduim2, color: primaryColor),
    bodyText2: const TextStyle(fontSize: textSizeMeduim2, color: darkColor),
    button: const TextStyle(fontSize: textSizeMeduim2, color: surfaceColor),
    overline: const TextStyle(
        fontSize: textSizeMeduim2,
        fontWeight: FontWeight.bold,
        color: primaryColor),
  ),

  //button
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: textSizeMeduim2, color: primaryColor)),
  )),
);
