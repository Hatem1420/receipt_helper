import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/core/widgets/loading_widget.dart';
import 'package:receipt_helper/features/home/presentation/cubit/home_cubit.dart';
import 'package:receipt_helper/features/home/presentation/cubit/home_state.dart';
import 'package:receipt_helper/features/home/presentation/widgets/home_widget.dart';
import 'package:receipt_helper/features/sub/receipt_review/presentation/pages/receipt_review_feature_screen.dart';
import 'package:sizer/sizer.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Feature Screen'),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        builder: (context, state) {
          return switch (state) {
            HomeSuccessState _ =>
              state.receipts.isEmpty
                  ? Center(child: Text('No Receipts Yet'))
                  : ListView.separated(
                      itemBuilder: (context, index) => HomeWidget(
                        receipt: state.receipts[index],
                        onDelete: (_) {
                          state.receipts.removeAt(index);
                          cubit.removeReceipt(state.receipts);
                        },
                        onTap: () => context.showBottomSheet(
                          widget: ReceiptReviewFeatureScreen(
                            receipt: state.receipts[index],
                          ),
                          height: 100.sh,
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: state.receipts.length,
                    ),
            HomeInitialState _ => Center(child: LoadingWidget()),
            _ => Center(child: Text('Sorry An error occurred')),
          };
        },
      ),
    );
  }
}
