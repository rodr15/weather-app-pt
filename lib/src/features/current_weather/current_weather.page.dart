import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/src/features/current_weather/application/daily_forecasts.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/application/selected_day_index.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/application/weather_data.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/components/background.dart';
import 'package:weather_app_pt/src/features/current_weather/components/blur_container.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_daily_details.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_detail_item.dart';
import 'package:weather_app_pt/src/features/current_weather/components/weather_icon.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/src/shared/domain/models/hour_forecast.dart';

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
                      '${forecast?.temp.toString() ?? 'N/A'}°',
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
                    '${forecast?.tempmax.toString() ?? 'N/A'}°',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${forecast?.tempmin.toString() ?? 'N/A'}°',
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
                  value: forecast?.precipprob.toString() ?? '0',
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
                  value: forecast?.uvindex.toString() ?? '0',
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
                  value: forecast?.windspeed.toString() ?? '0.0',
                  valueSuffix: ' m/s',
                  label: 'Wind\nSpeed',
                ),
              ],
            ),
          ),

          const Spacer(),
          const Expanded(
            child: BlurContainer(child: DailyForecastsPageView()),
          ),
        ],
      ),
    );
  }
}

/// This watches the [dailyForecastsProvider] for the data and synchronizes
/// the current page index with the [selectedDayIndexProvider].
class DailyForecastsPageView extends ConsumerStatefulWidget {
  /// Creates a page view for navigating through daily forecasts.
  const DailyForecastsPageView({super.key});

  @override
  ConsumerState<DailyForecastsPageView> createState() =>
      _DailyForecastsPageViewState();
}

class _DailyForecastsPageViewState
    extends ConsumerState<DailyForecastsPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize controller with the current state from the provider
    final initialIndex = ref.read(selectedDayIndexProvider);
    _pageController = PageController(initialPage: initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Callback executed when the user manually changes the page (swiping).
  void _onPageChanged(int newIndex) {
    // 1. Update the Riverpod state whenever the page changes.
    // This action changes the 'selectedDayIndexProvider' for the entire app.
    ref.read(selectedDayIndexProvider.notifier).setIndex(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final forecastsAsyncValue = ref.watch(dailyForecastsProvider);
    final selectedIndex = ref.watch(selectedDayIndexProvider);

    if (_pageController.hasClients && _pageController.page != selectedIndex) {
      _pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    return forecastsAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('Error loading data: $error')),
      data: (forecasts) {
        if (forecasts.isEmpty) {
          return const Center(child: Text('No forecast data available.'));
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: forecasts.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    final dayForecast = forecasts[index];
                    return DailyDetailsCard(forecast: dayForecast);
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  forecasts.length,
                  (index) => Dot(
                    selected: index == selectedIndex,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({required this.selected, super.key});
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.white : Colors.white.withOpacity(0.4),
      ),
    );
  }
}

// NOTE: You must define a DailyDetailsCard widget to display the info for one day.
class DailyDetailsCard extends StatelessWidget {
  final Forecast forecast;
  const DailyDetailsCard({required this.forecast, super.key});

  @override
  Widget build(BuildContext context) {
    final hourForecast = forecast.hourForecast;
    print(forecast.hourForecast);
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
