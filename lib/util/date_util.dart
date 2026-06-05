import 'package:intl/intl.dart';

class DateUtilsHelper {
  static String formattedToday() {
    final now = DateTime.now();

    String suffix(int day) {
      if (day >= 11 && day <= 13) return 'th';
      switch (day % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }

    return '${now.day}${suffix(now.day)} '
        '${DateFormat('MMMM yyyy, EEEE').format(now)}';
  }

  /// Formats date to: "09 May 2026 | 01:45 PM"
  static String formatDateTime(DateTime date) {
    // dd: Day, MMM: Short Month Name, yyyy: Year
    final DateFormat dateFormatter = DateFormat('dd MMM yyyy');
    // hh:mm: Time, a: AM/PM marker
    final DateFormat timeFormatter = DateFormat('hh:mm a');

    return "${dateFormatter.format(date)} | ${timeFormatter.format(date)}";
  }

  /// Formats date to: "09 May 2026"
  static String formatDate(DateTime date) {
    // dd: Day, MMM: Short Month Name, yyyy: Year
    return DateFormat('dd MMM yyyy').format(date);
  }
}
