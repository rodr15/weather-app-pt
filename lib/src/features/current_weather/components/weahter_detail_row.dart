import 'package:flutter/material.dart';
import 'package:weather_app_pt/src/features/current_weather/components/blur_container.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_detail_item.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_icon.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';

/// A row displaying key weather details such as probability of precipitation,
/// UV index, and wind speed, typically enclosed within a [BlurContainer].
class WeatherDetailsRow extends StatelessWidget {
  /// Creates a row to display weather details for a given forecast.
  const WeatherDetailsRow({
    super.key,
    required this.forecast,
  });

  /// The forecast data model used to populate the details.
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 1. Rain Probability
          WeatherDetailItem(
            iconData: WeatherIconId.rain.materialIcon,
            iconColor: WeatherIconId.rain.iconColor,
            value: forecast.precipprob.toString(),
            valueSuffix: '%',
            label: 'Chance of\nRain',
          ),
          VerticalDivider(
            color: Colors.white.withOpacity(0.4),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          // 2. UV Index
          WeatherDetailItem(
            iconData: WeatherIconId.clearDay.materialIcon,
            iconColor: WeatherIconId.clearDay.iconColor,
            value: forecast.uvindex.toString(),
            label: 'UV Index',
          ),
          VerticalDivider(
            color: Colors.white.withOpacity(0.4),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          // 3. Wind Speed
          WeatherDetailItem(
            iconData: WeatherIconId.wind.materialIcon,
            iconColor: WeatherIconId.wind.iconColor,
            value: forecast.windspeed.toString(),
            valueSuffix: ' m/s',
            label: 'Wind\nSpeed',
          ),
        ],
      ),
    );
  }
}
