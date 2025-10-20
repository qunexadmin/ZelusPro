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

/// Router provider
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Auth
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Stylist Dashboard
      GoRoute(
        path: '/dashboard/stylist',
        name: 'stylist_dashboard',
        builder: (context, state) => const StylistDashboardScreen(),
      ),

      // Salon Owner Dashboard
      GoRoute(
        path: '/dashboard/salon',
        name: 'salon_dashboard',
        builder: (context, state) => const SalonDashboardScreen(),
      ),

      // Calendar & Bookings
      GoRoute(
        path: '/calendar',
        name: 'calendar',
        builder: (context, state) => const CalendarScreen(),
      ),

      // Clients
      GoRoute(
        path: '/clients',
        name: 'clients',
        builder: (context, state) => const ClientsScreen(),
      ),

      // Profile
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),

      // Earnings
      GoRoute(
        path: '/earnings',
        name: 'earnings',
        builder: (context, state) => const EarningsScreen(),
      ),

      // Staff Management (Salon Owners)
      GoRoute(
        path: '/staff',
        name: 'staff',
        builder: (context, state) => const StaffScreen(),
      ),

      // Analytics (Salon Owners)
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
    ],
  );
});

