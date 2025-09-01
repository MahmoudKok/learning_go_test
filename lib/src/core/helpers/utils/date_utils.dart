/// Custom DateTime calculations that ignore time components (pure day math)
class CustomDateUtils {
  /// Strips time information from a DateTime (sets to 00:00:00)
  static DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Calculates whole days between two dates (ignoring time)
  /// Returns positive value even if [end] is before [start]
  static int daysBetween(DateTime end, DateTime start) {
    final first = _dateOnly(start);
    final last = _dateOnly(end);
    return (last.difference(first).inDays);
  }

  /// Checks if two dates fall on the same day (ignoring time)
  static bool isSameDay(DateTime a, DateTime b) {
    return _dateOnly(a) == _dateOnly(b);
  }

  /// Calculates elapsed days from [start] to now (ignoring time)
  static int daysElapsed(DateTime start) {
    return daysBetween(start, DateTime.now());
  }

  /// Calculates remaining days from now to [end] (ignoring time)
  /// Returns 0 if already past end date
  static int daysRemaining(DateTime end) {
    final remaining = daysBetween(DateTime.now(), end);
    return end.isAfter(DateTime.now()) ? remaining : 0;
  }

  /// Calculates progress fraction (0.0 to 1.0) between start and end dates
  /// Handles edge cases (same day, end before start, etc.)
  static double progressFraction(DateTime start, DateTime end) {
    if (start.isAfter(end)) return 1.0; // Edge case: start after end
    if (isSameDay(start, end)) return 1.0; // Same day = 100%

    final total = daysBetween(start, end);
    final elapsed = daysElapsed(start);

    return (elapsed / total).clamp(0.0, 1.0);
  }
}
