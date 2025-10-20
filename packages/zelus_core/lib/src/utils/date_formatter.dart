import 'package:intl/intl.dart';

/// Date formatting utilities
class DateFormatter {
  /// Format date as "Jan 15, 2025"
  static String formatDate(DateTime date) {
    return DateFormat('MMM d, y').format(date);
  }

  /// Format date as "January 15, 2025"
  static String formatDateLong(DateTime date) {
    return DateFormat('MMMM d, y').format(date);
  }

  /// Format time as "2:30 PM"
  static String formatTime(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }

  /// Format datetime as "Jan 15, 2025 at 2:30 PM"
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, y \'at\' h:mm a').format(dateTime);
  }

  /// Format as "Today", "Yesterday", or "Jan 15"
  static String formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'Today';
    } else if (dateOnly == yesterday) {
      return 'Yesterday';
    } else if (now.year == date.year) {
      return DateFormat('MMM d').format(date);
    } else {
      return DateFormat('MMM d, y').format(date);
    }
  }

  /// Format time ago: "2m ago", "3h ago", "2d ago"
  static String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inDays > 30) {
      return '${diff.inDays ~/ 30}mo ago';
    } else if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  /// Format day of week: "Monday", "Tuesday", etc.
  static String formatDayOfWeek(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  /// Format short day of week: "Mon", "Tue", etc.
  static String formatDayOfWeekShort(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  /// Parse time string like "14:30" to DateTime (today's date)
  static DateTime parseTimeString(String timeString) {
    final parts = timeString.split(':');
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  /// Get time string from DateTime: "14:30"
  static String getTimeString(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}

