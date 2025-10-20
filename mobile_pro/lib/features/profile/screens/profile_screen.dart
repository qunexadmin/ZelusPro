import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zelus_ui/zelus_ui.dart';
import '../../../providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: ZelusColors.gold.withOpacity(0.2),
              child: Icon(Icons.person, size: 50, color: ZelusColors.gold),
            ),
            const SizedBox(height: 16),
            Text(
              user?.name ?? 'Professional',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              user?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZelusColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 24),
            
            // Profile sections
            _ProfileSection(
              title: 'Services',
              items: [
                _ProfileItem(Icons.cut, 'Manage Services', () {}),
                _ProfileItem(Icons.add_photo_alternate, 'Portfolio', () {}),
              ],
            ),
            _ProfileSection(
              title: 'Business',
              items: [
                _ProfileItem(Icons.schedule, 'Working Hours', () {}),
                _ProfileItem(Icons.location_on, 'Location', () {}),
              ],
            ),
            _ProfileSection(
              title: 'Account',
              items: [
                _ProfileItem(Icons.settings, 'Settings', () {}),
                _ProfileItem(Icons.help_outline, 'Help & Support', () {}),
                _ProfileItem(Icons.logout, 'Logout', () async {
                  await ref.read(authProvider.notifier).logout();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _ProfileSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Card(
          child: Column(children: items),
        ),
      ],
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileItem(this.icon, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ZelusColors.textSecondary),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

