import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/core/navigation/routers.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_state.dart';
import 'package:receipt_helper/features/scan/presentation/widgets/receipt_widget.dart';
import 'package:sizer/sizer.dart';

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
          if (state is ScanErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
          if (state is ScanSaveSuccessState) {
            context.pop();
            context.go(Routes.home);
          }
          if (state is ScanSuccessState) {
            context.showBottomSheet(
              widget: ReceiptWidget(
                receipt: state.receipt,
                onSave: () {
                  cubit.saveReceipt(state.receipt);
                },
              ),
              height: 100.sh,
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: FilledButton(
              onPressed: () => cubit.capture(),
              child: Text('Scan a Receipt'),
            ),
          );
        },
      ),
    );
  }
}
