import 'package:flutter/material.dart';
import 'package:weather_app_pt/l10n/app_localizations.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_daily_detail_item.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';
import 'package:weather_app_pt/src/shared/extension/date.extension.dart';
import 'package:weather_app_pt/src/shared/utils/time_converter.dart';

/// A widget that displays key astronomical details for the day,
/// including sunrise, sunset, and moon phase.
///
/// This component arranges multiple [WeatherDailyDetailItem] widgets in a [Row]
/// with [VerticalDivider] separators for visual distinction.
class WeatherDailyDetails extends StatelessWidget {
  /// Creates a [WeatherDailyDetails] instance.
  const WeatherDailyDetails({
    required this.forecast,
    super.key,
  });

  /// The daily forecast data used to populate the sunrise, sunset, and moon
  /// phase times.
  final Forecast forecast;

  /// Builds the row containing the astronomical details.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherDailyDetailItem(
          icon: Icons.sunny,
          iconColor: Colors.orange,
          label: AppLocalizations.of(context)!.sunrise,
          value: TimeConverter.parseTime(
            context,
            forecast.sunrise ?? '',
          ).toFormattedTime(context),
        ),

        VerticalDivider(
          color: Colors.white.withOpacity(0.4),
          thickness: 1,
          indent: 10,
          endIndent: 10,
          width: 30,
        ),

        WeatherDailyDetailItem(
          icon: Icons.nights_stay,
          iconColor: Colors.deepPurple,
          label: AppLocalizations.of(context)!.sunset,
          value: TimeConverter.parseTime(
            context,
            forecast.sunset ?? '',
          ).toFormattedTime(context),
        ),

        VerticalDivider(
          color: Colors.white.withOpacity(0.4),
          thickness: 1,
          indent: 10,
          endIndent: 10,
          width: 30,
        ),

        WeatherDailyDetailItem(
          icon: Icons.wb_twilight,
          iconColor: Colors.lightBlue,
          label: 'Fase Lunar',
          value: ' ${((forecast.moonphase ?? 0.0) * 100).toStringAsFixed(0)} %',
        ),
      ],
    );
  }
}
