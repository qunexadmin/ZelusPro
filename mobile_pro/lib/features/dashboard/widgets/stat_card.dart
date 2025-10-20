import 'package:flutter/material.dart';
import 'package:zelus_ui/zelus_ui.dart';
import 'dart:ui';

/// Modern stat card with glassmorphism effect
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? trend; // e.g., "+12%" or "-5%"
  final bool? isPositiveTrend;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.trend,
    this.isPositiveTrend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ZelusColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ZelusColors.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Simple icon - no background
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 16),
                
          // Title first (minimal style)
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZelusColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 8),
          
          // Value with optional trend
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
              ),
              if (trend != null) ...[
                const SizedBox(width: 8),
                Text(
                  trend!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: (isPositiveTrend ?? true)
                        ? ZelusColors.success
                        : ZelusColors.error,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

