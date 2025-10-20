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
      appBar: AppBar(
        title: Text('Salon Dashboard'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: StatCard(title: 'Today\'s Revenue', value: '\$1,240', icon: Icons.attach_money, color: ZelusColors.success)),
                const SizedBox(width: 12),
                Expanded(child: StatCard(title: 'Total Bookings', value: '18', icon: Icons.calendar_today, color: ZelusColors.gold)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: StatCard(title: 'Active Staff', value: '6', icon: Icons.people, color: ZelusColors.info)),
                const SizedBox(width: 12),
                Expanded(child: StatCard(title: 'Salon Rating', value: '4.8', icon: Icons.star, color: ZelusColors.warning)),
              ],
            ),
            const SizedBox(height: 24),
            Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _ActionCard(Icons.people, 'Manage Staff', () => context.go('/staff')),
                _ActionCard(Icons.analytics, 'Analytics', () => context.go('/analytics')),
                _ActionCard(Icons.calendar_today, 'Bookings', () => context.go('/calendar')),
                _ActionCard(Icons.settings, 'Settings', () {}),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: ZelusColors.gold,
        onTap: (index) {
          if (index == 1) context.go('/calendar');
          if (index == 2) context.go('/staff');
          if (index == 3) context.go('/analytics');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Staff'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCard(this.icon, this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 44) / 2,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, size: 32, color: ZelusColors.gold),
                const SizedBox(height: 8),
                Text(label, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

