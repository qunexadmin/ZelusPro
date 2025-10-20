import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zelus_core/zelus_core.dart';
import 'package:zelus_ui/zelus_ui.dart';
import '../widgets/booking_list_item.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  // Mock bookings data
  final Map<DateTime, List<Map<String, dynamic>>> _bookings = {
    DateTime.now(): [
      {
        'id': '1',
        'customerName': 'Sarah Wilson',
        'serviceName': 'Haircut & Style',
        'startTime': '10:00 AM',
        'endTime': '11:00 AM',
        'status': 'confirmed',
        'price': 80.0,
      },
      {
        'id': '2',
        'customerName': 'Emily Chen',
        'serviceName': 'Color Treatment',
        'startTime': '2:00 PM',
        'endTime': '4:00 PM',
        'status': 'confirmed',
        'price': 150.0,
      },
      {
        'id': '3',
        'customerName': 'Michael Brown',
        'serviceName': 'Beard Trim',
        'startTime': '4:30 PM',
        'endTime': '5:00 PM',
        'status': 'pending',
        'price': 30.0,
      },
    ],
  };

  List<Map<String, dynamic>> _getBookingsForDay(DateTime day) {
    final dateOnly = DateTime(day.year, day.month, day.day);
    return _bookings[dateOnly] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final selectedDayBookings = _getBookingsForDay(_selectedDay);

    return Scaffold(
      backgroundColor: ZelusColors.background,
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              gradient: ZelusColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ZelusColors.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: _showAddAvailabilityDialog,
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
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 22),
              onSelected: (value) {
                if (value == 'today') {
                  setState(() {
                    _selectedDay = DateTime.now();
                    _focusedDay = DateTime.now();
                  });
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'today',
                  child: Text('Go to Today'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Modern Calendar Widget
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ZelusColors.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: ZelusColors.border.withOpacity(0.5),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ZelusColors.shadow,
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  gradient: ZelusColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: ZelusColors.primary.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: ZelusColors.primary, width: 2),
                ),
                markerDecoration: BoxDecoration(
                  color: ZelusColors.accent,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: ZelusColors.error),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                formatButtonDecoration: BoxDecoration(
                  color: ZelusColors.primaryLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                formatButtonTextStyle: TextStyle(
                  color: ZelusColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              eventLoader: (day) {
                return _getBookingsForDay(day);
              },
            ),
          ),

          // Modern Selected Date Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormatter.formatRelativeDate(_selectedDay),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${selectedDayBookings.length} bookings scheduled',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ZelusColors.textSecondary,
                          ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: selectedDayBookings.isEmpty
                        ? null
                        : ZelusColors.primaryGradient,
                    color: selectedDayBookings.isEmpty
                        ? ZelusColors.surfaceLight
                        : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${selectedDayBookings.length}',
                    style: TextStyle(
                      color: selectedDayBookings.isEmpty
                          ? ZelusColors.textSecondary
                          : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Modern Bookings List
          Expanded(
            child: selectedDayBookings.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ZelusColors.primary.withOpacity(0.1),
                                ZelusColors.secondary.withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.event_available_outlined,
                            size: 40,
                            color: ZelusColors.primary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'No bookings',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'You have no bookings on this day',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: ZelusColors.textSecondary,
                              ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: _showAddAvailabilityDialog,
                          icon: const Icon(Icons.add, size: 20),
                          label: const Text('Set Availability'),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    itemCount: selectedDayBookings.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final booking = selectedDayBookings[index];
                      return _ModernBookingItem(
                        booking: booking,
                        onTap: () => _showBookingDetails(booking),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddAvailabilityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Availability'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Set your available time slots for ${DateFormatter.formatDate(_selectedDay)}',
            ),
            const SizedBox(height: 16),
            // TODO: Add time slot picker
            const Text('Time slot picker coming soon...'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Save availability
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Availability saved')),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showBookingDetails(Map<String, dynamic> booking) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _DetailRow(
              icon: Icons.person,
              label: 'Customer',
              value: booking['customerName'],
            ),
            _DetailRow(
              icon: Icons.cut,
              label: 'Service',
              value: booking['serviceName'],
            ),
            _DetailRow(
              icon: Icons.access_time,
              label: 'Time',
              value: '${booking['startTime']} - ${booking['endTime']}',
            ),
            _DetailRow(
              icon: Icons.attach_money,
              label: 'Price',
              value: '\$${booking['price']}',
            ),
            _DetailRow(
              icon: Icons.info_outline,
              label: 'Status',
              value: booking['status'].toString().toUpperCase(),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Start navigation or message
                    },
                    child: const Text('Contact'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleBookingAction(Map<String, dynamic> booking, String action) {
    final message = action == 'accept'
        ? 'Booking confirmed'
        : 'Booking rejected';
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    // TODO: Update booking status via API
  }
}

/// Modern booking item widget
class _ModernBookingItem extends StatelessWidget {
  final Map<String, dynamic> booking;
  final VoidCallback onTap;

  const _ModernBookingItem({
    required this.booking,
    required this.onTap,
  });

  Color _getStatusColor() {
    switch (booking['status']) {
      case 'confirmed':
        return ZelusColors.success;
      case 'pending':
        return ZelusColors.warning;
      case 'cancelled':
        return ZelusColors.error;
      default:
        return ZelusColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ZelusColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ZelusColors.border.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: ZelusColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      booking['customerName'][0],
                      style: TextStyle(
                        color: statusColor,
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
                        booking['customerName'],
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        booking['serviceName'],
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
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    booking['status'].toString().toUpperCase(),
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ZelusColors.surfaceLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: statusColor),
                  const SizedBox(width: 8),
                  Text(
                    '${booking['startTime']} - ${booking['endTime']}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Spacer(),
                  Icon(Icons.attach_money, size: 16, color: ZelusColors.success),
                  Text(
                    '\$${booking['price']}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ZelusColors.success,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: ZelusColors.textSecondary),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZelusColors.textSecondary,
                ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

