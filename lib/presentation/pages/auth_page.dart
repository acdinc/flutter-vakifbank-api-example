import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants/app_strings.dart';
import '../../app/injection_container.dart';
import '../../core/extensions/build_context_extension.dart';
import '../blocs/auth/auth_bloc.dart';
import '../widgets/auth_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const AuthView(),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const FlutterLogo(size: 120),
            const Spacer(),
            Text(
              AppStrings.welcome,
              style: context.textTheme.headlineMedium,
            ),
            const Spacer(),
            const AuthButton(),
          ],
        ),
      ),
    );
  }
}
