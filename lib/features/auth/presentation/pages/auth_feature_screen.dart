import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/core/navigation/routers.dart';
import 'package:receipt_helper/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:receipt_helper/features/auth/presentation/cubit/auth_state.dart';

class AuthFeatureScreen extends StatelessWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Feature Screen')),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          context.hideLoading();
          if (state is AuthSuccessState) {
            context.go(Routes.home);
          }
          if (state is AuthErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
          if (state is AuthLoadingState) {
            context.showLoading();
          }
        },
        child: Center(
          child: Column(
            children: [
              FilledButton(
                onPressed: () => cubit.getAuthMethod(),
                child: Text('Sign in With Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
