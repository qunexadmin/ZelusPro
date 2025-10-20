import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zelus_ui/zelus_ui.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/stat_card.dart';

class SalonDashboardScreen extends ConsumerWidget {
  const SalonDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    return Scaffold(
      backgroundColor: ZelusColors.background,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZelusColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              user?.name ?? 'Salon Owner',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: ZelusColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ZelusColors.border.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_outlined, size: 22),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: ZelusColors.error,
                        shape: BoxShape.circle,
                        border: Border.all(color: ZelusColors.surface, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: ZelusColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ZelusColors.border.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined, size: 22),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Stat Cards
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Revenue',
                    value: '\$1,240',
                    icon: Icons.trending_up,
                    color: ZelusColors.success,
                    trend: '+18%',
                    isPositiveTrend: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    title: 'Bookings',
                    value: '18',
                    icon: Icons.event_available_outlined,
                    color: ZelusColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Active Staff',
                    value: '6',
                    icon: Icons.people_outline,
                    color: ZelusColors.accent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    title: 'Rating',
                    value: '4.8',
                    icon: Icons.star_rounded,
                    color: ZelusColors.warning,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Quick Actions - minimal
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _MinimalActionCard(
                  icon: Icons.people_outline,
                  label: 'Manage Staff',
                  onTap: () => context.go('/staff'),
                ),
                _MinimalActionCard(
                  icon: Icons.analytics_outlined,
                  label: 'Analytics',
                  onTap: () => context.go('/analytics'),
                ),
                _MinimalActionCard(
                  icon: Icons.calendar_today_outlined,
                  label: 'Bookings',
                  onTap: () => context.go('/calendar'),
                ),
                _MinimalActionCard(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// Minimal action card - ChatGPT style
class _MinimalActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MinimalActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ZelusColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ZelusColors.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ZelusColors.textPrimary, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: ZelusColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

