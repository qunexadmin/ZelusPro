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
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddAvailabilityDialog,
          ),
          PopupMenuButton<String>(
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
        ],
      ),
      body: Column(
        children: [
          // Calendar Widget
          Card(
            margin: const EdgeInsets.all(16),
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
                  color: ZelusColors.gold,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: ZelusColors.gold.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: ZelusColors.info,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: (day) {
                return _getBookingsForDay(day);
              },
            ),
          ),

          // Selected Date Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormatter.formatRelativeDate(_selectedDay),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  '${selectedDayBookings.length} bookings',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ZelusColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Bookings List
          Expanded(
            child: selectedDayBookings.isEmpty
                ? EmptyState(
                    icon: Icons.event_available_outlined,
                    title: 'No bookings',
                    message: 'You have no bookings on this day',
                    actionText: 'Set Availability',
                    onAction: _showAddAvailabilityDialog,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: selectedDayBookings.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final booking = selectedDayBookings[index];
                      return BookingListItem(
                        customerName: booking['customerName'],
                        serviceName: booking['serviceName'],
                        startTime: booking['startTime'],
                        endTime: booking['endTime'],
                        status: booking['status'],
                        price: booking['price'],
                        onTap: () => _showBookingDetails(booking),
                        onAccept: () => _handleBookingAction(booking, 'accept'),
                        onReject: () => _handleBookingAction(booking, 'reject'),
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

