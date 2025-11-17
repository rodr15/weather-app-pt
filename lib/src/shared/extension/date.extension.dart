import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_pt/l10n/app_localizations.dart';

/// Provides extension methods for the DateTime class to format dates.
extension DateTimeFriendlyFormatting on DateTime {
  /// Formats this [DateTime] object into a friendly string format like
  /// "Today, Nov 17", "Yesterday, Nov 16", or "Mon, Nov 10" for older dates.
  ///
  /// This method requires a [BuildContext] to access the necessary
  /// [AppLocalizations] instance for translating "Today" and "Yesterday."
  ///
  /// The current locale is determined via [AppLocalizations.localeName]
  /// and passed to [DateFormat] for localized month and day names.
  String toFriendlyDate(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    // Normalize dates to midnight for accurate comparison
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);

    final currentLocale = localizations.localeName;

    // Format for the Month and Day part: 'Nov 17'
    final monthDayFormatter = DateFormat('MMM d', currentLocale);
    final formattedMonthDay = monthDayFormatter.format(this);

    if (dateToCheck == today) {
      // e.g., "Today, Nov 17"
      return '${localizations.today}, $formattedMonthDay';
    } else if (dateToCheck == yesterday) {
      // e.g., "Yesterday, Nov 16"
      return '${localizations.yesterday}, $formattedMonthDay';
    } else {
      // Format for the Weekday, Month, and Day part: 'Mon, Nov 10'
      final standardFormatter = DateFormat('E, MMM d', currentLocale);
      return standardFormatter.format(this);
    }
  }

  /// Formats the time part of this [DateTime] object into a 12-hour
  /// clock format with an AM/PM indicator, such as "7:00 PM" or "3:00 AM".
  ///
  /// This method requires a [BuildContext] to access the current locale.
  /// The format is set to 'jm' which is the standard localized 12-hour
  /// time pattern in the [DateFormat] implementation.
  String toFormattedTime(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final currentLocale = localizations.localeName;

    // 'jm' is the standard short time format (e.g., 7:00 PM in en_US)
    // The actual pattern (e.g., 'h:mm a') is determined by the locale.
    final timeFormatter = DateFormat.jm(currentLocale);
    return timeFormatter.format(this);
  }
}
