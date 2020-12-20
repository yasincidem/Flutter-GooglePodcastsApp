import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final LightTheme = _buildLightTheme();
// ignore: non_constant_identifier_names
final DarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
}

ThemeData _buildDarkTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF212121),
    brightness: Brightness.dark,
    backgroundColor: Colors.red,
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );
}


ThemeData buildInternalDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    primaryColor: const Color(0xFF202225),
    backgroundColor: const Color(0xFF202225),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    scaffoldBackgroundColor: const Color(0xFF202225),
  );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: const Color(0xFF202225),
  primaryVariant: const Color(0xFF202225),
  secondary: const Color(0xFF202225),
  secondaryVariant: const Color(0xFF202225),
  surface: const Color(0xFF202225),
  background: const Color(0xFF202225),
  error: shrineErrorRed,
  onPrimary: const Color(0xFF202225),
  onSecondary: const Color(0xFF202225),
  onSurface: const Color(0xFF202225),
  onBackground: const Color(0xFF202225),
  onError: Colors.black,
  brightness: Brightness.dark,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;