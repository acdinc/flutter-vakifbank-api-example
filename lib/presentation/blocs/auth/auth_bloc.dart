import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_case/use_case.dart';
import '../../../domain/use_cases/auth_login_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authLoginUseCase) : super(const InitialState()) {
    on<AuthEvent>(_mapEventToState);
  }

  final AuthLoginUseCase authLoginUseCase;

  FutureOr<dynamic> _mapEventToState(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) {
    return event.map(
      login: (event) async {
        emit(const LoadingState());

        final failureOrSuccess = await authLoginUseCase(NoParams());

        return emit(
          failureOrSuccess.when(
            success: AuthenticatedState.new,
            failure: (error) => ErrorState(error.localizedErrorMessage),
          ),
        );
      },
    );
  }
}
