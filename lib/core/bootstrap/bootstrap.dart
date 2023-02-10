import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../observers/bloc_observer.dart';

void bootstrap(Widget app) {
  FlutterError.onError = (details) {
    developer.log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  runZonedGuarded(
    () => runApp(app),
    (error, stackTrace) =>
        developer.log(error.toString(), stackTrace: stackTrace),
  );
}
