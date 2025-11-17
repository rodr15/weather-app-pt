import 'package:flutter/material.dart';
import 'package:weather_app_pt/l10n/app_localizations.dart';
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
          WeatherDetailItem(
            iconData: WeatherIconId.rain.materialIcon,
            iconColor: WeatherIconId.rain.iconColor,
            value: (forecast.precipprob ?? 0 * 100).toStringAsFixed(0),
            valueSuffix: '%',
            label: AppLocalizations.of(context)!.chanceOfRain,
          ),

          VerticalDivider(
            color: Colors.white.withOpacity(0.4),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),

          WeatherDetailItem(
            iconData: WeatherIconId.clearDay.materialIcon,
            iconColor: WeatherIconId.clearDay.iconColor,
            value: forecast.uvindex.toString(),
            label: AppLocalizations.of(context)!.uvIndex,
          ),

          VerticalDivider(
            color: Colors.white.withOpacity(0.4),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),

          WeatherDetailItem(
            iconData: WeatherIconId.wind.materialIcon,
            iconColor: WeatherIconId.wind.iconColor,
            value: forecast.windspeed.toString(),
            valueSuffix: ' m/s',
            label: AppLocalizations.of(context)!.windSpeend,
          ),
        ],
      ),
    );
  }
}
