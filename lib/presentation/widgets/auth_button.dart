import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../app/strings.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import 'custom_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (data) => context.goNamed(Routes.bondList.name),
        );
      },
      builder: (context, state) {
        return CustomButton(
          text: AppStrings.login,
          loadingText: AppStrings.processing,
          onPressed: () => context.read<AuthBloc>().add(const AuthLoginEvent()),
          isLoading: state == const AuthState.loading(),
          buttonOpacity: 0.8,
        );
      },
    );
  }
}
