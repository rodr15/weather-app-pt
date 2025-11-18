import 'package:flutter/material.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_horly_item.dart';
import 'package:weather_app_pt/src/shared/domain/models/hour_forecast.dart';

class WeatherHourlyDetails extends StatelessWidget {
  const WeatherHourlyDetails({
    required this.hourForecast,
    super.key,
    List<HourForecast>? hourForecastList,
  });
  final List<HourForecast> hourForecast;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherHourlyItem(forecast: hourForecast[5]),
        divider(),
        WeatherHourlyItem(forecast: hourForecast[12]),
        divider(),
        WeatherHourlyItem(forecast: hourForecast[20]),
        divider(),
      ],
    );
  }

  VerticalDivider divider() {
    return VerticalDivider(
      color: Colors.white.withOpacity(0.4),
      thickness: 1,
      indent: 10,
      endIndent: 10,
      width: 30,
    );
  }
}
