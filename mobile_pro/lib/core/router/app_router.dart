import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/screens/login_screen.dart';
import '../../features/dashboard/screens/stylist_dashboard_screen.dart';
import '../../features/dashboard/screens/salon_dashboard_screen.dart';
import '../../features/calendar/screens/calendar_screen.dart';
import '../../features/clients/screens/clients_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/earnings/screens/earnings_screen.dart';
import '../../features/staff/screens/staff_screen.dart';
import '../../features/analytics/screens/analytics_screen.dart';
import '../widgets/main_scaffold.dart';

/// Router provider
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Auth (no bottom nav)
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Main app routes with persistent bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(
            currentPath: state.uri.path,
            child: child,
          );
        },
        routes: [
          // Stylist Dashboard
          GoRoute(
            path: '/dashboard/stylist',
            name: 'stylist_dashboard',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const StylistDashboardScreen(),
            ),
          ),

          // Salon Owner Dashboard
          GoRoute(
            path: '/dashboard/salon',
            name: 'salon_dashboard',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SalonDashboardScreen(),
            ),
          ),

          // Calendar & Bookings
          GoRoute(
            path: '/calendar',
            name: 'calendar',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const CalendarScreen(),
            ),
          ),

          // Clients
          GoRoute(
            path: '/clients',
            name: 'clients',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ClientsScreen(),
            ),
          ),

          // Profile
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),

          // Earnings
          GoRoute(
            path: '/earnings',
            name: 'earnings',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const EarningsScreen(),
            ),
          ),

          // Staff Management (Salon Owners)
          GoRoute(
            path: '/staff',
            name: 'staff',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const StaffScreen(),
            ),
          ),

          // Analytics (Salon Owners)
          GoRoute(
            path: '/analytics',
            name: 'analytics',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AnalyticsScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});

