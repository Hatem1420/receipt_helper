import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/features/sub/receipt_review/presentation/cubit/receipt_review_cubit.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/entities/receipt_item_entity.dart';
import 'package:receipt_helper/features/sub/receipt_review/presentation/cubit/receipt_review_state.dart';
import 'package:receipt_helper/features/sub/user_sheets/presentation/pages/user_sheets_feature_widget.dart';

class ReceiptReviewFeatureScreen extends StatelessWidget {
  final ReceiptEntity? receipt;
  const ReceiptReviewFeatureScreen({super.key, this.receipt});

  @override
  Widget build(BuildContext context) {
    final merchant = receipt?.merchant;
    final info = receipt?.receiptInfo;
    final totals = receipt?.totals;

    return BlocProvider(
      create: (context) => ReceiptReviewCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ReceiptReviewCubit>();
          String? sheetId;
          String? sheetName;
          return SafeArea(
            child: BlocListener<ReceiptReviewCubit, ReceiptReviewState>(
              listener: (context, state) {
                context.hideLoading();
                if (state is ReceiptReviewLoadingState) {
                  context.showLoading();
                }
                if (state is ReceiptReviewErrorState) {
                  context.showSnackBar(state.message, isError: true);
                }
                if (state is ReceiptReviewSuccessState) {
                  context.pop(true);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          merchant?.name ?? 'Receipt',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Center(
                        child: Text(
                          info?.date ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),

                      const SizedBox(height: 24),

                      _TotalCard(
                        amount: totals?.total,
                        currency: info?.currency,
                      ),

                      const SizedBox(height: 24),

                      _InfoRow(label: 'Receipt No', value: info?.receiptNumber),

                      _InfoRow(label: 'Payment', value: info?.paymentMethod),

                      _InfoRow(label: 'VAT Number', value: merchant?.taxNumber),

                      const SizedBox(height: 24),

                      Text(
                        'Items',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      const SizedBox(height: 12),

                      if (receipt != null)
                        ListView.separated(
                          itemCount: receipt!.items.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              Divider(thickness: 0, color: Colors.transparent),
                          itemBuilder: (context, index) =>
                              _ItemTile(item: receipt!.items[index]),
                        ),

                      const Divider(height: 32),

                      _AmountRow(
                        title: 'Subtotal',
                        amount: totals?.subTotalModel,
                      ),

                      _AmountRow(title: 'Tax', amount: totals?.tax),

                      if (totals?.discount != null)
                        _AmountRow(title: 'Discount', amount: totals?.discount),

                      const Divider(),

                      _AmountRow(
                        title: 'Total',
                        amount: totals?.total,
                        isBold: true,
                      ),

                      const SizedBox(height: 24),

                      UserSheetsFeatureWidget(
                        onSelect: (selectedSpreadId, selectedSheetName) {
                          sheetId = selectedSpreadId;
                          sheetName = selectedSheetName;
                        },
                      ),

                      const SizedBox(height: 24),

                      if (receipt != null)
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            icon: Icon(Icons.done),
                            onPressed: () {
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
                                      receipt!,
                                      sheetId: sheetId,
                                      sheetName: sheetName,
                                    );
                                  }
                                });
                              } else {
                                cubit.saveReceipt(
                                  receipt!,
                                  sheetId: sheetId,
                                  sheetName: sheetName,
                                );
                              }
                            },
                            label: const Text('Save Receipt'),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TotalCard extends StatelessWidget {
  const _TotalCard({this.amount, this.currency});

  final double? amount;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Total Amount',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '${amount?.toStringAsFixed(2) ?? '--'} ${currency ?? ''}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item});

  final ReceiptItemEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      title: Text(item.name ?? ''),
      subtitle: Text('Qty: ${item.quantity ?? 0} ${item.unitPrice}'),
      trailing: Text(
        (item.totalPrice ?? 0).toStringAsFixed(2),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value ?? '-'),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({required this.title, this.amount, this.isBold = false});

  final String title;
  final double? amount;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final style = isBold ? const TextStyle(fontWeight: FontWeight.bold) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(amount?.toStringAsFixed(2) ?? '--', style: style),
        ],
      ),
    );
  }
}
