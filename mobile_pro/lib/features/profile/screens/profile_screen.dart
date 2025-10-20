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
      backgroundColor: ZelusColors.background,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
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
              icon: const Icon(Icons.edit_outlined, size: 22),
              onPressed: () {
                // TODO: Edit profile
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Clean profile header
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ZelusColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, size: 40, color: ZelusColors.primary),
            ),
            const SizedBox(height: 20),
            Text(
              user?.name ?? 'Professional',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              user?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZelusColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 32),
            
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
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ZelusColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ZelusColors.border.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Column(children: items),
        ),
        const SizedBox(height: 20),
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


