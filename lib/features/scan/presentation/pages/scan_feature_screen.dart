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
                onSave: (sheetId, sheetName) {
                  if (sheetId == null || sheetName == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Spreadsheet info not enough'),
                        content: Text(
                          'Either spreadsheet name or sheet name is not provided,\n Do you want to create a new spreadsheet?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
                            child: Text('Cancel'),
                          ),
                          FilledButton(
                            onPressed: () => context.pop(true),
                            child: Text('Create'),
                          ),
                        ],
                      ),
                    ).then((value) {
                      if (value == true) {
                        cubit.saveReceipt(
                          state.receipt,
                          sheetId: sheetId,
                          sheetName: sheetName,
                        );
                      }
                    });
                  } else {
                    cubit.saveReceipt(
                      state.receipt,
                      sheetId: sheetId,
                      sheetName: sheetName,
                    );
                  }
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
