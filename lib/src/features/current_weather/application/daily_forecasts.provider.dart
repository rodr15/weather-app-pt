import 'package:riverpod/riverpod.dart';
import 'package:weather_app_pt/src/features/current_weather/application/weather_data.provider.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';

/// A [FutureProvider] that watches the result of [currentPlaceWeatherProvider]
/// and extracts the list of daily forecasts ([List<Forecast>]).
///
/// This provider simplifies access to the list of days for components like
final FutureProvider<List<Forecast>> dailyForecastsProvider =
    FutureProvider<List<Forecast>>((ref) async {
      final place = await ref.watch(currentPlaceWeatherProvider.future);

      return place.forecastDaysList?.sublist(0, 6) ?? <Forecast>[];
    });
