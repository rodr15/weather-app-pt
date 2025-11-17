import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/src/features/current_weather/application/weather_data.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/components/background.dart';
import 'package:weather_app_pt/src/features/current_weather/components/blur_container.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_detail_item.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_icon.dart';

/// A Riverpod [ConsumerWidget] responsible for fetching and displaying the
/// current weather details for the current place.
///
/// It watches [currentPlaceWeatherProvider] and handles the loading, error,
/// and data states to render the appropriate UI.
class CurrentWeather extends ConsumerWidget {
  /// Creates a widget to display the current weather state.
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsyncValue = ref.watch(currentPlaceWeatherProvider);

    return weatherAsyncValue.when(
      loading: () => const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: CircularProgressIndicator()),
      ),

      error: (err, stack) => Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text(
            'Error: $err',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),

      data: (place) {
        final todayForecast = place.days?.first;
        final weatherCondition = WeatherIconId.fromId(
          todayForecast?.icon ?? '',
        );

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Background(
            firstColor: weatherCondition.colors.first,
            secondColor: weatherCondition.colors.last,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          right: -80,
                          top: -80,
                          child: ClipRect(
                            child: Icon(
                              weatherCondition.materialIcon,
                              size: 350,
                              color: weatherCondition.iconColor.withAlpha(
                                100,
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '${todayForecast?.temp.toString() ?? 'N/A'}°',
                              style: TextStyle(
                                color: weatherCondition.iconColor.withAlpha(
                                  255,
                                ),
                                fontSize: 150,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlurContainer(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_upward_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${todayForecast?.tempmax.toString() ?? 'N/A'}°',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_downward_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${todayForecast?.tempmin.toString() ?? 'N/A'}°',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  BlurContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherDetailItem(
                          iconData: WeatherIconId.rain.materialIcon,
                          iconColor: WeatherIconId.rain.iconColor,
                          value: todayForecast?.precipprob.toString() ?? '0',
                          valueSuffix: '%',
                          label: 'Chance of\nRain',
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
                          value: todayForecast?.uvindex.toString() ?? '0',
                          label: 'UV Index',
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
                          value: todayForecast?.windspeed.toString() ?? '0.0',
                          valueSuffix: ' m/s',
                          label: 'Wind\nSpeed',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
