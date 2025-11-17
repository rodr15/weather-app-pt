import 'package:flutter/material.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_daily_details.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';

/// A widget that displays detailed forecast information, prioritizing
/// hourly data if available, or falling back to general daily details.
///
/// If [forecast.hourForecast] is present, it currently displays the description
/// of the first hourly forecast. Otherwise, it renders a full [WeatherDailyDetails] card.
class DailyDetailsCard extends StatelessWidget {
  /// Creates a [DailyDetailsCard] instance.
  const DailyDetailsCard({
    required this.forecast,
    super.key,
  });

  /// The daily [Forecast] model containing general and hourly weather data.
  final Forecast forecast;

  /// Builds the detail card based on the availability of hourly forecast data.
  @override
  Widget build(BuildContext context) {
    final hourForecast = forecast.hourForecast;

    if (hourForecast == null || hourForecast.isEmpty) {
      return WeatherDailyDetails(forecast: forecast);
    }
    return Center(
      child: Text(
        'Description: ${hourForecast.first}',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
