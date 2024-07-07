import 'package:flutter/material.dart';

final _lightTheme = ThemeData.light();
final _lightTextTheme = _lightTheme.textTheme;
final _darkTheme = ThemeData.dark();
final _darkTextTheme = _darkTheme.textTheme;

final kMaterialLightTheme = _lightTheme.copyWith(
  primaryColor: Colors.orangeAccent,
  textTheme: _lightTextTheme.copyWith(
    displayLarge: _lightTextTheme.displayLarge?.copyWith(
      fontSize: 36.0,
    ),
    displayMedium: _lightTextTheme.displayMedium?.copyWith(
      fontSize: 34.0,
    ),
    displaySmall: _lightTextTheme.displaySmall?.copyWith(
      fontSize: 32.0,
    ),
    headlineLarge: _lightTextTheme.headlineLarge?.copyWith(
      fontSize: 30.0,
    ),
    headlineMedium: _lightTextTheme.headlineMedium?.copyWith(
      fontSize: 28.0,
    ),
    headlineSmall: _lightTextTheme.headlineSmall?.copyWith(
      fontSize: 26.0,
    ),
    titleLarge: _lightTextTheme.titleLarge?.copyWith(
      fontSize: 24.0,
    ),
    titleMedium: _lightTextTheme.titleMedium?.copyWith(
      fontSize: 22.0,
    ),
    titleSmall: _lightTextTheme.titleSmall?.copyWith(
      fontSize: 20.0,
    ),
    bodyLarge: _lightTextTheme.bodyLarge?.copyWith(
      fontSize: 18.0,
    ),
    bodyMedium: _lightTextTheme.bodyMedium?.copyWith(
      fontSize: 16.0,
    ),
    bodySmall: _lightTextTheme.bodySmall?.copyWith(
      fontSize: 14.0,
    ),
    labelLarge: _lightTextTheme.labelLarge?.copyWith(
      fontSize: 12.0,
    ),
    labelMedium: _lightTextTheme.labelMedium?.copyWith(
      fontSize: 10.0,
    ),
    labelSmall: _lightTextTheme.labelSmall?.copyWith(
      fontSize: 8.0,
    ),
  ),
);
final kMaterialDarkTheme = _darkTheme.copyWith(
  primaryColor: Colors.orangeAccent,
  textTheme: _lightTextTheme.copyWith(
    displayLarge: _darkTextTheme.displayLarge?.copyWith(
      fontSize: 36.0,
    ),
    displayMedium: _darkTextTheme.displayMedium?.copyWith(
      fontSize: 34.0,
    ),
    displaySmall: _darkTextTheme.displaySmall?.copyWith(
      fontSize: 32.0,
    ),
    headlineLarge: _darkTextTheme.headlineLarge?.copyWith(
      fontSize: 30.0,
    ),
    headlineMedium: _darkTextTheme.headlineMedium?.copyWith(
      fontSize: 28.0,
    ),
    headlineSmall: _darkTextTheme.headlineSmall?.copyWith(
      fontSize: 26.0,
    ),
    titleLarge: _darkTextTheme.titleLarge?.copyWith(
      fontSize: 24.0,
    ),
    titleMedium: _darkTextTheme.titleMedium?.copyWith(
      fontSize: 22.0,
    ),
    titleSmall: _darkTextTheme.titleSmall?.copyWith(
      fontSize: 20.0,
    ),
    bodyLarge: _darkTextTheme.bodyLarge?.copyWith(
      fontSize: 18.0,
    ),
    bodyMedium: _darkTextTheme.bodyMedium?.copyWith(
      fontSize: 16.0,
    ),
    bodySmall: _darkTextTheme.bodySmall?.copyWith(
      fontSize: 14.0,
    ),
    labelLarge: _darkTextTheme.labelLarge?.copyWith(
      fontSize: 12.0,
    ),
    labelMedium: _darkTextTheme.labelMedium?.copyWith(
      fontSize: 10.0,
    ),
    labelSmall: _darkTextTheme.labelSmall?.copyWith(
      fontSize: 8.0,
    ),
  ),
);

final kCupertinoLightTheme = MaterialBasedCupertinoThemeData(
  materialTheme: kMaterialLightTheme,
);
final kCupertinoDarkTheme = MaterialBasedCupertinoThemeData(
  materialTheme: kMaterialDarkTheme,
);
