import 'package:flutter/material.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/entities/receipt_item_entity.dart';

class ReceiptWidget extends StatelessWidget {
  final ReceiptEntity receipt;
  final Function()? onSave;
  const ReceiptWidget({super.key, required this.receipt, this.onSave});

  @override
  Widget build(BuildContext context) {
    final merchant = receipt.merchant;
    final info = receipt.receiptInfo;
    final totals = receipt.totals;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  merchant?.name ?? 'Receipt',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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

              _TotalCard(amount: totals?.total, currency: info?.currency),

              const SizedBox(height: 24),

              _InfoRow(label: 'Receipt No', value: info?.receiptNumber),

              _InfoRow(label: 'Payment', value: info?.paymentMethod),

              _InfoRow(label: 'VAT Number', value: merchant?.taxNumber),

              const SizedBox(height: 24),

              Text('Items', style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 12),

              ...receipt.items.map((item) => _ItemTile(item: item)),

              const Divider(height: 32),

              _AmountRow(title: 'Subtotal', amount: totals?.subTotalModel),

              _AmountRow(title: 'Tax', amount: totals?.tax),

              if (totals?.discount != null)
                _AmountRow(title: 'Discount', amount: totals?.discount),

              const Divider(),

              _AmountRow(title: 'Total', amount: totals?.total, isBold: true),

              const SizedBox(height: 24),

              if (onSave != null)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (onSave != null) {
                        onSave!();
                      }
                    },
                    child: const Text('Save Receipt'),
                  ),
                ),
            ],
          ),
        ),
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
      contentPadding: EdgeInsets.zero,
      title: Text(item.name ?? ''),
      subtitle: item.quantity != null ? Text('Qty: ${item.quantity}') : null,
      trailing: item.totalPrice != null
          ? Text(
              item.totalPrice!.toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          : null,
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
