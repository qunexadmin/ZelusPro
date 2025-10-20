import 'package:flutter/material.dart';
import 'package:zelus_ui/zelus_ui.dart';

class BookingListItem extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String startTime;
  final String endTime;
  final String status;
  final double price;
  final VoidCallback onTap;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const BookingListItem({
    super.key,
    required this.customerName,
    required this.serviceName,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.price,
    required this.onTap,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final isPending = status == 'pending';

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customerName,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          serviceName,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ZelusColors.textSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  _StatusChip(status: status),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: ZelusColors.textTertiary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$startTime - $endTime',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZelusColors.success,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              if (isPending && onAccept != null && onReject != null) ...[
                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onReject,
                        icon: const Icon(Icons.close, size: 18),
                        label: const Text('Reject'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: ZelusColors.error,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onAccept,
                        icon: const Icon(Icons.check, size: 18),
                        label: const Text('Accept'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  Color get _color {
    switch (status) {
      case 'confirmed':
        return ZelusColors.success;
      case 'pending':
        return ZelusColors.warning;
      case 'completed':
        return ZelusColors.info;
      case 'cancelled':
        return ZelusColors.error;
      default:
        return ZelusColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: _color,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

