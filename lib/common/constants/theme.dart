import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

final classPlannerTheme = ThemeData(
  colorScheme: colorScheme,
  primaryColor: colorScheme.primary,
  accentColor: Color(0xFF002a92),
  backgroundColor: colorScheme.background,
  scaffoldBackgroundColor: colorScheme.background,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeThroughPageTransitionsBuilder()
    },
  ),
);

final ColorScheme colorScheme = ColorScheme.light(
    primary: Color(0xFF4B52C3),
    primaryVariant: Color(0xFF363B94),
    secondary: Color(0xFFea9f42),
    secondaryVariant: Color(0xFFCA8838),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    error: Color(0xFF000000),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onSurface: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onError: Color(0xFFF72866),
    brightness: Brightness.light);
