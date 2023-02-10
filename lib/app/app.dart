import 'package:flutter/material.dart';

import '../presentation/pages/auth_page.dart';
import 'constants/app_strings.dart';
import 'theme/app_theme.dart';

class MyAwesomeApp extends StatelessWidget {
  const MyAwesomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
