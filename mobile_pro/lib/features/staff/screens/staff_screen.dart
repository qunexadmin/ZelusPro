import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zelus_ui/zelus_ui.dart';

class StaffScreen extends ConsumerWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staff = [
      {
        'name': 'Jane Smith',
        'role': 'Senior Stylist',
        'bookings': 12,
        'rating': 4.9,
        'email': 'jane@zeluspro.com',
        'phone': '(555) 123-4567',
        'status': 'active',
      },
      {
        'name': 'Michael Chen',
        'role': 'Color Specialist',
        'bookings': 8,
        'rating': 4.8,
        'email': 'michael@zeluspro.com',
        'phone': '(555) 234-5678',
        'status': 'active',
      },
      {
        'name': 'Sarah Johnson',
        'role': 'Stylist',
        'bookings': 10,
        'rating': 4.7,
        'email': 'sarah@zeluspro.com',
        'phone': '(555) 345-6789',
        'status': 'active',
      },
    ];

    return Scaffold(
      backgroundColor: ZelusColors.background,
      appBar: AppBar(
        title: Text(
          'Staff Management',
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
                color: ZelusColors.border,
                width: 1,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_list, size: 22),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: staff.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: ZelusColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.group_outlined,
                      size: 40,
                      color: ZelusColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No staff members',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add your first staff member',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ZelusColors.textSecondary,
                        ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: staff.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final member = staff[index];
                return _ModernStaffCard(member: member);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add staff member coming soon')),
          );
        },
        backgroundColor: ZelusColors.primary,
        icon: const Icon(Icons.person_add, size: 20),
        label: const Text(
          'Add Staff',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

/// Modern staff card widget
class _ModernStaffCard extends StatelessWidget {
  final Map<String, dynamic> member;

  const _ModernStaffCard({required this.member});

  Color _getRoleColor(String role) {
    if (role.contains('Senior')) return ZelusColors.primary;
    if (role.contains('Specialist')) return ZelusColors.accent;
    return ZelusColors.secondary;
  }

  @override
  Widget build(BuildContext context) {
    final roleColor = _getRoleColor(member['role']);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ZelusColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ZelusColors.border,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: roleColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    member['name'][0],
                    style: TextStyle(
                      color: roleColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member['name'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      member['role'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZelusColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: ZelusColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  member['status'].toString().toUpperCase(),
                  style: TextStyle(
                    color: ZelusColors.success,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ZelusColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.event,
                            size: 14,
                            color: ZelusColors.textSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Today',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: ZelusColors.textSecondary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${member['bookings']} bookings',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: ZelusColors.border,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: ZelusColors.warning,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Rating',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: ZelusColors.textSecondary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${member['rating']}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
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

