import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

  double dynamicWidth(double x) => screenWidth * x;
  double dynamicHeight(double x) => screenHeight * x;

  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom != 0;
}

extension ThemeExtension on BuildContext {
  ThemeData get materialTheme => Theme.of(this);

  Color get primaryColor => materialTheme.primaryColor;
  Color get scaffoldBackgroundColor => materialTheme.scaffoldBackgroundColor;

  ColorScheme get colorScheme => materialTheme.colorScheme;
  Color get shadowColor => materialTheme.shadowColor;

  Color get backgroundColor => colorScheme.background;

  TextTheme get textTheme => materialTheme.textTheme;

  bool get isDarkTheme => materialTheme.brightness == Brightness.dark;
}
