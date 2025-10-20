import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zelus_core/zelus_core.dart';
import 'package:zelus_ui/zelus_ui.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/stat_card.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/upcoming_booking_card.dart';

class StylistDashboardScreen extends ConsumerWidget {
  const StylistDashboardScreen({super.key});

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
              user?.name ?? 'Stylist',
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
              onPressed: () {
                // TODO: Navigate to notifications
              },
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
              onPressed: () {
                // TODO: Navigate to settings
              },
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Refresh dashboard data
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today's Stats with modern cards
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Bookings',
                      value: '4',
                      icon: Icons.event_available_outlined,
                      color: ZelusColors.primary,
                      trend: '+12%',
                      isPositiveTrend: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      title: 'Earnings',
                      value: '\$380',
                      icon: Icons.trending_up,
                      color: ZelusColors.success,
                      trend: '+8%',
                      isPositiveTrend: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Messages',
                      value: '3',
                      icon: Icons.chat_bubble_outline,
                      color: ZelusColors.accent,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      title: 'Rating',
                      value: '4.9',
                      icon: Icons.star_rounded,
                      color: ZelusColors.warning,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Quick Actions with modern design
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
                children: [
                  _ModernQuickActionCard(
                    icon: Icons.add_photo_alternate_outlined,
                    label: 'Upload',
                    gradient: ZelusColors.primaryGradient,
                    onTap: () {},
                  ),
                  _ModernQuickActionCard(
                    icon: Icons.schedule_outlined,
                    label: 'Schedule',
                    gradient: ZelusColors.accentGradient,
                    onTap: () => context.go('/calendar'),
                  ),
                  _ModernQuickActionCard(
                    icon: Icons.people_outline,
                    label: 'Clients',
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () => context.go('/clients'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Upcoming Bookings with modern header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Bookings',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context.go('/calendar');
                    },
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    label: const Text('View All'),
                    style: TextButton.styleFrom(
                      foregroundColor: ZelusColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Booking Cards (Mock Data) with modern styling
              _ModernBookingCard(
                customerName: 'Sarah Wilson',
                serviceName: 'Haircut & Style',
                time: '10:00 AM',
                avatarColor: ZelusColors.primary,
              ),
              const SizedBox(height: 12),
              _ModernBookingCard(
                customerName: 'Emily Chen',
                serviceName: 'Color Treatment',
                time: '2:00 PM',
                avatarColor: ZelusColors.secondary,
              ),
              const SizedBox(height: 12),
              _ModernBookingCard(
                customerName: 'Michael Brown',
                serviceName: 'Beard Trim',
                time: '4:30 PM',
                avatarColor: ZelusColors.accent,
              ),
              const SizedBox(height: 32),

              // Recent Activity with modern design
              Text(
                'Recent Activity',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ZelusColors.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: ZelusColors.border.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    _ModernActivityItem(
                      icon: Icons.person_add_outlined,
                      iconColor: ZelusColors.primary,
                      title: 'New follower',
                      subtitle: 'Jessica Lee started following you',
                      time: '2h ago',
                    ),
                    const Divider(height: 24),
                    _ModernActivityItem(
                      icon: Icons.star_rounded,
                      iconColor: ZelusColors.warning,
                      title: 'New review',
                      subtitle: '5 stars from David Park',
                      time: '5h ago',
                    ),
                    const Divider(height: 24),
                    _ModernActivityItem(
                      icon: Icons.check_circle_outline,
                      iconColor: ZelusColors.success,
                      title: 'Booking confirmed',
                      subtitle: 'Tomorrow at 11:00 AM',
                      time: '1d ago',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

}

/// Modern quick action card with gradient
class _ModernQuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final LinearGradient gradient;
  final VoidCallback onTap;

  const _ModernQuickActionCard({
    required this.icon,
    required this.label,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Modern booking card
class _ModernBookingCard extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String time;
  final Color avatarColor;

  const _ModernBookingCard({
    required this.customerName,
    required this.serviceName,
    required this.time,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ZelusColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ZelusColors.border.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: avatarColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                customerName[0],
                style: TextStyle(
                  color: avatarColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  serviceName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZelusColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: avatarColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time, size: 14, color: avatarColor),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: avatarColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Modern activity item
class _ModernActivityItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const _ModernActivityItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZelusColors.textSecondary,
                    ),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZelusColors.textTertiary,
              ),
        ),
      ],
    );
  }
}

