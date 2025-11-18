import 'package:flutter/material.dart';
import 'package:weather_app_pt/l10n/app_localizations.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_detail_item.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_icon.dart';
import 'package:weather_app_pt/src/shared/domain/models/hour_forecast.dart';
import 'package:weather_app_pt/src/shared/extension/date.extension.dart';
import 'package:weather_app_pt/src/shared/utils/time_converter.dart';

class WeatherHourlyItem extends StatelessWidget {
  const WeatherHourlyItem({required this.forecast, super.key});
  final HourForecast forecast;
  @override
  Widget build(BuildContext context) {
    final weatherIcon = WeatherIconId.fromId(forecast.icon ?? '');
    return Column(
      spacing: 5,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white54,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              weatherIcon.materialIcon,
              color: weatherIcon.iconColor,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          TimeConverter.parseTime(
            context,
            forecast.datetime ?? '',
          ).toFormattedTime(context),
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        Text(
          '${forecast.temp}°',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.4),
          thickness: 1,
          indent: 10,
          endIndent: 10,
          height: 30,
        ),

        WeatherDetailItem(
          iconData: WeatherIconId.rain.materialIcon,
          iconColor: WeatherIconId.rain.iconColor,
          value: (forecast.precipprob ?? 0 * 100).toStringAsFixed(0),
          valueSuffix: '%',
          label: AppLocalizations.of(context)!.chanceOfRain,
        ),

        WeatherDetailItem(
          iconData: WeatherIconId.clearDay.materialIcon,
          iconColor: WeatherIconId.clearDay.iconColor,
          value: forecast.uvindex?.toStringAsFixed(0) ?? '0',
          label: AppLocalizations.of(context)!.uvIndex,
        ),

        WeatherDetailItem(
          iconData: WeatherIconId.wind.materialIcon,
          iconColor: WeatherIconId.wind.iconColor,
          value: forecast.windspeed.toString(),
          valueSuffix: ' m/s',
          label: AppLocalizations.of(context)!.windSpeend,
        ),
      ],
    );
  }
}
