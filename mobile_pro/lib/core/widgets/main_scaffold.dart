import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zelus_ui/zelus_ui.dart';

/// Main scaffold with persistent bottom navigation
class MainScaffold extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const MainScaffold({
    super.key,
    required this.child,
    required this.currentPath,
  });

  int _getCurrentIndex() {
    if (currentPath.startsWith('/dashboard')) return 0;
    if (currentPath.startsWith('/calendar')) return 1;
    if (currentPath.startsWith('/clients')) return 2;
    if (currentPath.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ZelusColors.surface,
          border: Border(
            top: BorderSide(
              color: ZelusColors.border.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: _getCurrentIndex(),
              selectedItemColor: ZelusColors.primary,
              unselectedItemColor: ZelusColors.textTertiary,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go('/dashboard/stylist');
                    break;
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
                    _showMoreMenu(context);
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 24),
                  activeIcon: Icon(Icons.home, size: 24),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined, size: 24),
                  activeIcon: Icon(Icons.calendar_today, size: 24),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline, size: 24),
                  activeIcon: Icon(Icons.people, size: 24),
                  label: 'Clients',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 24),
                  activeIcon: Icon(Icons.person, size: 24),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz, size: 24),
                  label: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: ZelusColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ZelusColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.attach_money, color: ZelusColors.success),
              ),
              title: const Text('Earnings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                context.go('/earnings');
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ZelusColors.info.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.help_outline, color: ZelusColors.info),
              ),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to help
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ZelusColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.logout, color: ZelusColors.error),
              ),
              title: const Text('Logout'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                context.go('/login');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

