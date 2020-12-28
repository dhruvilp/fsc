import 'package:flutter/material.dart';

/// Palette
const deep_green = Color(0xFF285c4d);
const deep_green_2 = Color(0xFF31705e);
const green = Color(0xFF359935);
const red = Color(0xFFca0d19);

/// Black & White
const white = Colors.white;
const blue_grey = Color(0xFFe4e8ed);
const silver = Color(0xFFF5F5F5);
const grey_light = Color(0xFFe1e6e8);
const grey = Color(0xFF898c8c);
const charcoal_light = Color(0xFF4a4a4a);
const charcoal = Color(0xFF292929);
const charcoal_dark = Color(0xFF1A1A1A);
const black = Colors.black;
const semi_transparent = Colors.black87;
const overlay = Color.fromRGBO(0, 0, 0, 80);
const transparent = Colors.transparent;
const box_shadow = Color(0x0d000000);

/// Themes
final kHTheme = _buildHelveticaTheme();
final kHCTheme = _buildHelveticaCondensedTheme();

ThemeData _buildHelveticaTheme() {
  final base = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: deep_green,
    primaryColorLight: green,
    primaryColorDark: deep_green,
    accentColor: red,
    backgroundColor: white,
    scaffoldBackgroundColor: white,
    fontFamily: 'Helvetica',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 100.0, color: charcoal_light),
      headline2: TextStyle(fontSize: 90.0, color: charcoal_light),
      headline3: TextStyle(fontSize: 45.0, color: charcoal_light),
      headline4: TextStyle(fontSize: 35.0, color: charcoal_light),
      headline5: TextStyle(fontSize: 25.0, color: charcoal_light),
      headline6: TextStyle(fontSize: 20.0, color: charcoal_light),
      subtitle1: TextStyle(fontSize: 18.0, color: charcoal_light),
      bodyText2: TextStyle(color: charcoal_light),
      bodyText1: TextStyle(color: charcoal_light),
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(fontSize: 100.0, color: deep_green),
      headline2: TextStyle(fontSize: 90.0, color: deep_green),
      headline3: TextStyle(fontSize: 45.0, color: deep_green),
      headline4: TextStyle(fontSize: 35.0, color: deep_green),
      headline5: TextStyle(fontSize: 25.0, color: deep_green),
      headline6: TextStyle(fontSize: 20.0, color: deep_green),
      subtitle1: TextStyle(fontSize: 18.0, color: deep_green),
      bodyText2: TextStyle(color: deep_green),
      bodyText1: TextStyle(color: deep_green),
    ),
  );
  return base;
}

ThemeData _buildHelveticaCondensedTheme() {
  final base = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: deep_green,
    primaryColorLight: green,
    primaryColorDark: deep_green,
    accentColor: red,
    backgroundColor: white,
    scaffoldBackgroundColor: white,
    fontFamily: 'HelveticaCondensed',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 100.0, color: charcoal_light),
      headline2: TextStyle(fontSize: 90.0, color: charcoal_light),
      headline3: TextStyle(fontSize: 45.0, color: charcoal_light),
      headline4: TextStyle(fontSize: 35.0, color: charcoal_light),
      headline5: TextStyle(fontSize: 25.0, color: charcoal_light),
      headline6: TextStyle(fontSize: 20.0, color: charcoal_light),
      subtitle1: TextStyle(fontSize: 18.0, color: charcoal_light),
      bodyText2: TextStyle(color: charcoal_light),
      bodyText1: TextStyle(color: charcoal_light),
    ),
  );
  return base;
}

/*
<< OLD >>  SIZE   WEIGHT    << NEW >>
display4   112.0  thin      headline1
display3   56.0   normal    headline2
display2   45.0   normal    headline3
display1   34.0   normal    headline4
headline   24.0   normal    headline5
title      20.0   medium    headline6
subhead    16.0   normal    subtitle1
subtitle   14.0   medium    subtitle2
body2      14.0   medium    bodyText1
body1      14.0   normal    bodyText2
caption    12.0   normal    caption
button     14.0   medium    button
overline   10.0   normal    overline
*/
