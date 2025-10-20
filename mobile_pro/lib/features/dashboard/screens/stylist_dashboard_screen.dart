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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dashboard'),
            Text(
              'Welcome back, ${user?.name ?? 'Stylist'}!',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZelusColors.textSecondary,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Refresh dashboard data
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today's Stats
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Today\'s Bookings',
                      value: '4',
                      icon: Icons.calendar_today,
                      color: ZelusColors.gold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      title: 'Today\'s Earnings',
                      value: '\$380',
                      icon: Icons.attach_money,
                      color: ZelusColors.success,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'New Messages',
                      value: '3',
                      icon: Icons.message_outlined,
                      color: ZelusColors.info,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      title: 'Rating',
                      value: '4.9',
                      icon: Icons.star,
                      color: ZelusColors.warning,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Quick Actions
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: QuickActionButton(
                      icon: Icons.add_photo_alternate_outlined,
                      label: 'Upload Work',
                      onTap: () {
                        // TODO: Navigate to upload
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionButton(
                      icon: Icons.schedule,
                      label: 'Set Availability',
                      onTap: () {
                        context.go('/calendar');
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionButton(
                      icon: Icons.people_outline,
                      label: 'Clients',
                      onTap: () {
                        context.go('/clients');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Upcoming Bookings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Bookings',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/calendar');
                    },
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Booking Cards (Mock Data)
              UpcomingBookingCard(
                customerName: 'Sarah Wilson',
                serviceName: 'Haircut & Style',
                time: '10:00 AM',
                date: DateFormatter.formatDate(DateTime.now()),
                customerPhoto: null,
                onTap: () {
                  // TODO: Navigate to booking details
                },
              ),
              const SizedBox(height: 12),
              UpcomingBookingCard(
                customerName: 'Emily Chen',
                serviceName: 'Color Treatment',
                time: '2:00 PM',
                date: DateFormatter.formatDate(DateTime.now()),
                customerPhoto: null,
                onTap: () {
                  // TODO: Navigate to booking details
                },
              ),
              const SizedBox(height: 12),
              UpcomingBookingCard(
                customerName: 'Michael Brown',
                serviceName: 'Beard Trim',
                time: '4:30 PM',
                date: DateFormatter.formatDate(DateTime.now()),
                customerPhoto: null,
                onTap: () {
                  // TODO: Navigate to booking details
                },
              ),
              const SizedBox(height: 24),

              // Recent Activity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _ActivityItem(
                        icon: Icons.person_add_outlined,
                        title: 'New follower',
                        subtitle: 'Jessica Lee started following you',
                        time: '2h ago',
                      ),
                      const Divider(height: 24),
                      _ActivityItem(
                        icon: Icons.star_outlined,
                        title: 'New review',
                        subtitle: '5 stars from David Park',
                        time: '5h ago',
                      ),
                      const Divider(height: 24),
                      _ActivityItem(
                        icon: Icons.schedule,
                        title: 'Booking confirmed',
                        subtitle: 'Tomorrow at 11:00 AM',
                        time: '1d ago',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: ZelusColors.gold,
        unselectedItemColor: ZelusColors.textSecondary,
        onTap: (index) {
          switch (index) {
            case 0:
              break; // Already on dashboard
            case 1:
              context.go('/calendar');
              break;
            case 2:
              context.go('/clients');
              break;
            case 3:
              context.go('/profile');
              break;
            case 4:
              // More menu
              _showMoreMenu(context);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  void _showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Earnings'),
              onTap: () {
                Navigator.pop(context);
                context.go('/earnings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                final ref = ProviderScope.containerOf(context);
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) {
                  context.go('/login');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  const _ActivityItem({
    required this.icon,
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
            color: ZelusColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: ZelusColors.gold),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

