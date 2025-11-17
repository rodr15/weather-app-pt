import 'package:flutter/material.dart' show BuildContext;
import 'package:intl/intl.dart';
import 'package:weather_app_pt/l10n/app_localizations.dart';

/// A utility class dedicated to parsing time strings into DateTime objects.
///
/// This class handles the specific logic for converting a time string
/// (e.g., "04:30 PM") into a DateTime object, using the 'hh:mm a' format.
/// The resulting DateTime will have the time set to the parsed value,
/// but the date part will default to the current day.
class TimeConverter {
  /// Prevents the class from being instantiated.
  const TimeConverter._();

  /// Parses a time string (e.g., "04:30 PM") formatted as 'hh:mm a'
  /// into a [DateTime] object.
  ///
  /// The resulting [DateTime] will contain the parsed time, but the
  /// date component will be the current day (as determined by [DateFormat.parse]).
  ///
  /// [timeString]: The time string to parse, expected format 'hh:mm a'.
  /// [locale]: The locale to use for parsing the AM/PM indicator (e.g., 'en_US').
  static DateTime parseTime(
    BuildContext context,
    String timeString,
  ) {
    const format = 'hh:mm';
    final locale = AppLocalizations.of(context)!.localeName;

    return DateFormat(format, locale).parse(timeString);
  }
}
