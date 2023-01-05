import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: const Color(0xFF419E73),
    canvasColor: Colors.white,
    textTheme: const TextTheme(
      headline2: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      headline3: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headline5: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headline6: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
