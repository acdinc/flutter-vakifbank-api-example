import 'dart:developer' as developer;

extension AnonStringExtension on String? {
  String get anonIfNull => this ?? 'anon';
}

extension Log on String {
  void log({String? name, StackTrace? stackTrace}) {
    developer.log(toString(), name: name ?? 'LOG', stackTrace: stackTrace);
  }
}
