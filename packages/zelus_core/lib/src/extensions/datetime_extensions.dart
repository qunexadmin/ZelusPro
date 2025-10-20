/// DateTime extension methods
extension DateTimeExtensions on DateTime {
  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Check if date is in the past
  bool get isPast {
    return isBefore(DateTime.now());
  }

  /// Check if date is in the future
  bool get isFuture {
    return isAfter(DateTime.now());
  }

  /// Get date only (without time)
  DateTime get dateOnly {
    return DateTime(year, month, day);
  }

  /// Add business days (skip weekends)
  DateTime addBusinessDays(int days) {
    var date = this;
    var addedDays = 0;

    while (addedDays < days) {
      date = date.add(const Duration(days: 1));
      if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
        addedDays++;
      }
    }

    return date;
  }

  /// Check if date is weekend
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  /// Check if date is weekday
  bool get isWeekday {
    return !isWeekend;
  }

  /// Get start of day (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Get end of day (23:59:59)
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /// Get start of week (Monday)
  DateTime get startOfWeek {
    return subtract(Duration(days: weekday - 1)).startOfDay;
  }

  /// Get end of week (Sunday)
  DateTime get endOfWeek {
    return add(Duration(days: DateTime.daysPerWeek - weekday)).endOfDay;
  }

  /// Get start of month
  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  /// Get end of month
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0, 23, 59, 59);
  }
}

