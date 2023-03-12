
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get light {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 231, 195, 32),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
    );
  }
}
