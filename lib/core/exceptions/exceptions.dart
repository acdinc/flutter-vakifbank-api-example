import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../extensions/string_extensions.dart';

part 'exceptions.freezed.dart';

extension ObjectExtension on Object {
  Exceptions get getException {
    switch (runtimeType) {
      case DioError:
        return Exceptions.server(this as DioError);
      case TypeError:
        return Exceptions.type(this as TypeError);
      case EmptyException:
        return Exceptions.empty(this);
      default:
        return Exceptions.other(this);
    }
  }
}

@freezed
// abstract class Exceptions with Exception, _$Exceptions {
class Exceptions with _$Exceptions implements Exception {
  const Exceptions._() : super();
  const factory Exceptions.server(DioError error) = ServerException;
  const factory Exceptions.type(TypeError error) = TypeException;
  const factory Exceptions.empty(dynamic data) = EmptyException;
  const factory Exceptions.other(Object? object) = OtherException;

  String get localizedErrorMessage {
    return when<String>(
      server: (e) {
        'Request error: ${e.response?.statusCode} ${e.response?.statusMessage}'
            .log();

        return 'Server error!';
      },
      type: (e) {
        'Type/Decoding error: $e.'.log();

        return 'Type error!';
      },
      empty: (d) {
        'Null/Empty error: $d'.log();

        return 'No data!';
      },
      other: (o) {
        'Unknown error: $o'.log();

        return 'Ops! Something went wrong!..';
      },
    );
  }
}
