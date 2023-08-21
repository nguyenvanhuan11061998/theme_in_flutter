import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  static ThemeData greenTheme = lightTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  );

  static ThemeData blueTheme = lightTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: false,
  );
}
