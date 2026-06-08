import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_state.dart';

class ScanFeatureScreen extends StatelessWidget {
  const ScanFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScanCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Scan Feature Screen')),
      body: BlocConsumer<ScanCubit, ScanState>(
        listener: (context, state) {
          context.hideLoading();
          if (state is ScanLoadingState) {
            context.showLoading();
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                FilledButton(
                  onPressed: () => cubit.capture(),
                  child: Text('Scan a Receipt'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
