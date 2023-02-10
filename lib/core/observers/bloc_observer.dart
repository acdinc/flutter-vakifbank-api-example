import 'package:flutter_bloc/flutter_bloc.dart';

import '../extensions/string_extensions.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    'Bloc OnCreate: ${bloc.runtimeType}'.log();
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    'Bloc Onchange: ${bloc.runtimeType}, $change'.log();
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    'Bloc OnClose: ${bloc.runtimeType}'.log();
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    'Bloc OnError: ${bloc.runtimeType}, $error'.log(stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
