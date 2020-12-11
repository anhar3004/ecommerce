import 'package:flutter/material.dart';

class Constants {
  static String appName = "Furniture App";

  //Colors for theme
  static Color lightPrimary = Color.fromRGBO(113, 119, 217, 1);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color.fromRGBO(143, 148, 251, 1);
  static Color darkAccent = Colors.orangeAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightPrimary,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightBG,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightPrimary,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: lightAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: lightAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightPrimary,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
