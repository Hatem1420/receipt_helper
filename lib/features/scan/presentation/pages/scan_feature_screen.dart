import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/core/navigation/routers.dart';
import 'package:receipt_helper/features/sub/receipt_review/presentation/pages/receipt_review_feature_screen.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_state.dart';
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
          if (state is ScanSuccessState) {
            context
                .showBottomSheet(
                  widget: ReceiptReviewFeatureScreen(receipt: state.receipt),
                  height: 100.sh,
                )
                .then((value) {
                  if (value == true && context.mounted) {
                    context.go(Routes.home);
                  }
                });
          }
        },
        builder: (context, state) {
          return Center(
            child: FilledButton.icon(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () => cubit.capture(),
              label: Text('Scan a Receipt'),
            ),
          );
        },
      ),
    );
  }
}
