import 'package:flutter/material.dart';

import 'router.dart';
import 'strings.dart';
import 'themes.dart';

class MyAwesomeApp extends StatelessWidget {
  const MyAwesomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appTitle,
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
