import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zelus_ui/zelus_ui.dart';

class StaffScreen extends ConsumerWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staff = [
      {'name': 'Jane Smith', 'role': 'Senior Stylist', 'bookings': 12, 'rating': 4.9},
      {'name': 'Michael Chen', 'role': 'Color Specialist', 'bookings': 8, 'rating': 4.8},
      {'name': 'Sarah Johnson', 'role': 'Stylist', 'bookings': 10, 'rating': 4.7},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Staff Management')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: staff.length,
        itemBuilder: (context, index) {
          final member = staff[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: ZelusColors.gold.withOpacity(0.2),
                child: Text(member['name'].toString()[0]),
              ),
              title: Text(member['name'] as String),
              subtitle: Text('${member['role']} • ${member['bookings']} bookings today'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 16, color: ZelusColors.warning),
                  Text(' ${member['rating']}'),
                ],
              ),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.person_add),
        label: const Text('Add Staff'),
      ),
    );
  }
}

