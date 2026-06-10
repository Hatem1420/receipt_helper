import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_helper/core/navigation/routers.dart';
import 'package:receipt_helper/core/widgets/loading_widget.dart';
import 'package:receipt_helper/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:receipt_helper/features/loading/presentation/cubit/loading_state.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<LoadingCubit>();

    return Scaffold(
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          if (state is LoadingSuccessState) {
            context.go(Routes.home);
          } else {
            context.go(Routes.auth);
          }
        },
        child: Center(child: LoadingWidget()),
      ),
    );
  }
}
