import 'package:flutter/material.dart';
import 'package:zelus_ui/zelus_ui.dart';

class UpcomingBookingCard extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String time;
  final String date;
  final String? customerPhoto;
  final VoidCallback onTap;

  const UpcomingBookingCard({
    super.key,
    required this.customerName,
    required this.serviceName,
    required this.time,
    required this.date,
    this.customerPhoto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Customer Avatar
              CircleAvatar(
                radius: 24,
                backgroundColor: ZelusColors.surface,
                backgroundImage:
                    customerPhoto != null ? NetworkImage(customerPhoto!) : null,
                child: customerPhoto == null
                    ? const Icon(Icons.person, color: ZelusColors.textSecondary)
                    : null,
              ),
              const SizedBox(width: 12),

              // Booking Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      serviceName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ZelusColors.textSecondary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: ZelusColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$time • $date',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Action Button
              Icon(
                Icons.chevron_right,
                color: ZelusColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

