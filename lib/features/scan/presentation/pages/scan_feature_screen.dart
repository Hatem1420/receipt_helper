import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/entities/receipt_item_entity.dart';
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
    final receipt = ReceiptEntity(
      items: [
        ReceiptItemEntity(
          name: 'some',
          quantity: 5,
          totalPrice: 56,
          unitPrice: 5,
        ),
      ],
    );

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
            context.go(Routes.home);
          }
          if (state is ScanSuccessState) {
            context.showBottomSheet(
              widget: ReceiptWidget(
                receipt: state.receipt,
                onSave: () {
                  context.pop();
                  cubit.saveReceipt(state.receipt);
                },
              ),
              height: 100.sh,
            );
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
                ElevatedButton(
                  onPressed: () => context.showBottomSheet(
                    widget: ReceiptWidget(receipt: receipt),
                    height: 100.sh,
                  ),
                  child: Text('data'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
