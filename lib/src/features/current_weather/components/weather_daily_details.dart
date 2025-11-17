import 'package:flutter/material.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_daily_detail_item.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';

/// A widget that displays key astronomical details for the day,
/// including sunrise, sunset, and moon phase.
///
/// This component arranges multiple [WeatherDailyDetailItem] widgets in a [Row]
/// with [VerticalDivider] separators for visual distinction.
class WeatherDailyDetails extends StatelessWidget {
  /// Creates a [WeatherDailyDetails] instance.
  const WeatherDailyDetails({
    super.key,
    required this.forecast,
  });

  /// The daily forecast data used to populate the sunrise, sunset, and moon phase times.
  final Forecast forecast;

  /// Builds the row containing the astronomical details.
  @override
  Widget build(BuildContext context) {
    // You can use a common container (like BlurContainer from before)
    // or a simple Card/Container for grouping.
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherDailyDetailItem(
          icon: Icons.sunny,
          iconColor: Colors.orange,
          label: 'Amanecer',
          value: forecast.sunrise ?? 'N/A',
        ),

        // Visual Separator
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
          label: 'Atardecer',
          value: forecast.sunset ?? 'N/A',
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
