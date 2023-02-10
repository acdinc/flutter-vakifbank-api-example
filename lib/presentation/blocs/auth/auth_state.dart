import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/auth_response/auth_response_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = InitialState;
  const factory AuthState.loading() = LoadingState;
  const factory AuthState.error(String errorMessage) = ErrorState;
  const factory AuthState.authenticated(AuthResponseEntity data) =
      AuthenticatedState;
}
