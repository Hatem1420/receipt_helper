import 'package:flutter/material.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';

class HomeWidget extends StatelessWidget {
  final ReceiptEntity? receipt;
  final VoidCallback? onTap;
  const HomeWidget({super.key, this.receipt, this.onTap});

  @override
  Widget build(BuildContext context) {
    final merchant = receipt?.merchant;
    final info = receipt?.receiptInfo;
    final totals = receipt?.totals;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(radius: 24, child: const Icon(Icons.receipt_long)),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      merchant?.name ?? 'Unknown Store',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      info?.date ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(Icons.shopping_bag_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${receipt?.items.length} items',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),

                        const SizedBox(width: 12),

                        const Icon(Icons.payments_outlined, size: 16),
                        const SizedBox(width: 4),

                        Expanded(
                          child: Text(
                            info?.paymentMethod ?? '-',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${totals?.total?.toStringAsFixed(2) ?? '--'} ${info?.currency ?? ''}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text('Total', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
