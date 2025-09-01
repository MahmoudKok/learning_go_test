import 'package:learning_go_test/src/localization/app_languages.dart';
import 'package:easy_localization/easy_localization.dart';

extension DateTimeExt on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  bool isYesterday() {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    return day == yesterday.day &&
        month == yesterday.month &&
        year == yesterday.year;
  }

  // yyyy-mm-dd
  String get stringFormat => toIso8601String().substring(0, 10);
}

extension DateExtensions on DateTime {
  String get toUtcString => DateFormat('yyyy, dd, MMM', 'en').format(toUtc());

  String toUtcStringBasedOnLocale() {
    if (AppLanguages.isArabic) {
      return "${DateFormat('MMM', 'ar').format(toUtc())}, ${DateFormat('dd, yyyy', 'en').format(toUtc())}";
    } else {
      return DateFormat('yyyy, dd, MMM').format(toUtc());
    }
  }
}

extension DateTimeFormater on DateTime {
  // yyyy-mm-dd
  String get simpleFormat => toIso8601String().substring(0, 10);
  String asDetailedDate() {
    // Choose time format based on 12-hour (am/pm) style
    final timeFormat = DateFormat.jm('en');
    // Format time as '1:00 pm'
    final timeString = timeFormat.format(this);

    // Format date part as 'YYYY \ MM \ DD'
    final dateString =
        '$year \\ ${month.toString().padLeft(2, '0')} \\ ${day.toString().padLeft(2, '0')}';

    // Combine time and date with the separator
    return '$timeString - $dateString';
  }

  String toYearMonthDayFormattedString() {
    return '$year \\ ${month.toString().padLeft(2, '0')} \\ ${day.toString().padLeft(2, '0')}';
  }

  String dateWithTime() {
    // Determine if the time is AM or PM
    final period = hour >= 12 ? ' PM' : ' AM';

    // Convert hour to 12-hour format, handling midnight and noon correctly
    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;

    // Format minutes with two digits
    final formattedMinute = minute.toString().padLeft(2, '0');

    // Create time and date strings
    final time = '$formattedHour:$formattedMinute$period';
    final date =
        '$year \\ ${month.toString().padLeft(2, '0')} \\ ${day.toString().padLeft(2, '0')}';

    // Combine time and date
    return '$time - $date';
  }

  String toHoursMinutesFormattedString() {
    final timeFormat = DateFormat.jm('en');
    // Format time as '1:00 pm'
    final timeString = timeFormat.format(this);
    return timeString;
  }
}
