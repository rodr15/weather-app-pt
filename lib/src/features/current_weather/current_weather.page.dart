import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/src/features/current_weather/application/selected_day_index.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/application/weather_data.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/components/background.dart';
import 'package:weather_app_pt/src/features/current_weather/components/blur_container.dart';
import 'package:weather_app_pt/src/features/current_weather/components/daily_forecaste_page_view.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weahter_detail_row.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_icon.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';

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
    final selectedIndex = ref.watch(selectedDayIndexProvider);

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
        final forecast = place.forecastDaysList?[selectedIndex];
        final weatherCondition = WeatherIconId.fromId(
          forecast?.icon ?? '',
        );
        if (forecast == null) {
          return const Scaffold(
            body: Center(
              child: Text('No se ha podido cargar la informacion'),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Background(
            firstColor: weatherCondition.colors.first,
            secondColor: weatherCondition.colors.last,
            child: _SelectedForecastInfo(forecast: forecast),
          ),
        );
      },
    );
  }
}

class _SelectedForecastInfo extends StatelessWidget {
  const _SelectedForecastInfo({required this.forecast});

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final weatherCondition = WeatherIconId.fromId(
      forecast.icon ?? '',
    );

    return Padding(
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
                      '${forecast.temp}°',
                      style: TextStyle(
                        color: weatherCondition.iconColor.withAlpha(
                          255,
                        ),
                        fontSize: 150,
                        letterSpacing: -5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: BlurContainer(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${forecast.tempmax}°',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${forecast.tempmin}°',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: WeatherDetailsRow(forecast: forecast),
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const BlurContainer(child: DailyForecastsPageView()),
          ),
        ],
      ),
    );
  }
}
