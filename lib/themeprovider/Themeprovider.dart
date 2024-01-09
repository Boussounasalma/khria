import 'package:flutter/material.dart';
class MyThemes{
  static final darkTheme= ThemeData(
    scaffoldBackgroundColor:  Colors.grey.shade900,
    colorScheme:  ColorScheme.dark(),
  );
  static final lighTheme= ThemeData(
    scaffoldBackgroundColor:  Colors.white,
    colorScheme:  ColorScheme.light(),
  );
}