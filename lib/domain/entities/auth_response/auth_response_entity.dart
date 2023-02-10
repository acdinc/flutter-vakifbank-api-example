// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_entity.freezed.dart';
part 'auth_response_entity.g.dart';

@freezed
class AuthResponseEntity with _$AuthResponseEntity {
  AuthResponseEntity._();

  factory AuthResponseEntity({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'token_type') String? tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    String? scope,
  }) = _AuthResponseEntity;

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseEntityFromJson(json);
}

AuthResponseEntity deserializeAuthResponseEntity(Map<String, dynamic> json) =>
    AuthResponseEntity.fromJson(json);
